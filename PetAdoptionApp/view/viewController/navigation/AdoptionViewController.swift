//
//  SegundoViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class AdoptionViewController: UIViewController {

    @IBOutlet weak var adoptionTableView: UITableView!
    @IBOutlet weak var cardMessage: UIView!
    @IBOutlet weak var cardMessageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconAdoption: UIImageView!
    
    let viewModel = AdoptionViewModel(adoptionRepository: AdoptionDataSource())
    var adoptions : [Adoption] = []
    let user = LocalUserRepository().getUser()
    var loader : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        adoptionTableView.delegate = self
        adoptionTableView.dataSource = self
        viewModel.delegate = self
        
        setupObserver()
  
    }
    
    func setupView() {
        cardMessageLabel.titleColor()
        titleLabel.titleColor()
        
        if let user = LocalUserRepository().getUser() {
            iconAdoption.image = self.getIconByUser(typeUser: user.typeUser)
            titleLabel.text = user.getTitleByUser()
            cardMessageLabel.text = user.getMessageByUser()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAdoptions()
    }
    

    func loadAdoptions(){
        if let user = LocalUserRepository().getUser() {
            print("USER::: \(user)")
            viewModel.getAdoptions(id: user.idUser)
        }
    }

    
    
    func setupObserver(){
        viewModel.didFinishAdoptionApprove = { response in
            self.loader?.dismiss(animated: true, completion: {
                self.showSuccessPopUp(title: "Felicidades!", description: response.message)
            })
            
        }
    }
    
    

    


}

extension AdoptionViewController: AdoptionDelegate, CellProtocol, PopUpSuccessProtocol{
    
    func successAcceptAction(action: Bool) {
        loadAdoptions()
    }
    
    
    func getAdoptions(adoptions: [Adoption]) {
        self.adoptions = adoptions
        adoptionTableView.reloadData()
        if(adoptions.isEmpty){
            cardMessage.isHidden = false
        }else{
            cardMessage.isHidden = true
        }
    }
    
    
    func acceptCellAction(idAdoption: Int, idUser:Int) {
        if let usr = user {
            if(usr.isOwner()){
                if(idAdoption != -1 && idUser != -1){
                    let request = ApproveAdoptionRequest(idAdoption: idAdoption, idUser: idUser)
                    self.loader = self.showLoader(msm: "Aprobando...")
                    viewModel.approveAdoption(request: request)
                }
            }
        }
    }
    
    
}


extension AdoptionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adoptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdoptionTableViewCell", for: indexPath) as? AdoptionTableViewCell else{
            return UITableViewCell()
        }
        
        tableView.separatorColor = UIColor.white
        
        let adoption = adoptions[indexPath.row]
        cell.delegate = self
        
        cell.adoption = adoption
        cell.petNameLabel.text = adoption.pet.name
        cell.petRaceLabel.text = adoption.pet.race
        cell.petImage.loadImage(url: adoption.pet.images[0].url)
        cell.petSexLogo.image = self.getIconBySex(sex: adoption.pet.sex)
        cell.userImage.loadImage(url: adoption.user.image)
        cell.userNameLabel.text = adoption.user.fullName
        
        cell.petNameLabel.titleColor()
        cell.petRaceLabel.detailColor()
        cell.userNameLabel.titleColor()
        cell.userDetailLabel.detailColor()
        cell.petImage.roundBorder(corner: 15, round: false)
        cell.userImage.roundBorder(corner: 0, round: true)
        cell.statusButton.roundButton()
        cell.iconStatus.alpha = 0
     
        
        let typeUser = self.user?.typeUser ?? -1

        
        
        if(typeUser == AppUtils.OWNER_ID){
            cell.userDetailLabel.text = "Quiere Adoptar"
            if(adoption.isApproved()){
                cell.statusButton.setTitle("Solicitud Aceptado", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 1
            }else{
                cell.statusButton.setTitle("Aceptar adopción", for: .normal)
                cell.statusButton.roundButton()
                cell.statusButton.isEnabled = true
                cell.iconStatus.alpha = 0
            }
        }else{
            cell.userDetailLabel.text = "Dueño"
            if(adoption.isApproved()){
                cell.statusButton.setTitle("Adopción aprobado", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 1
     
            }else{
                cell.statusButton.setTitle("Solicitud enviado", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 0
            }
        }
       
    
        return cell
    }
    
    

    
}

extension AdoptionViewController: UITableViewDelegate{
    
}
