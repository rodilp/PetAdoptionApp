//
//  SegundoViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class AdoptionViewController: UIViewController{

    @IBOutlet weak var adoptionTableView: UITableView!
    @IBOutlet weak var cardMessage: UIView!
    @IBOutlet weak var cardMessageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconAdoption: UIImageView!
    
    let viewModel = AdoptionViewModel(adoptionRepository: AdoptionRepository())
    var adoptions : [Adoption] = []
    let local = LocalDataRepository(localData: LocalDataSource())
    var loader : UIAlertController?
    
    var idAdoption:Int = 0
    var idUser:Int = 0
    
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
        
        if let user = local.getUser() {
            iconAdoption.image = self.getIconByUser(typeUser: user.typeUser)
            titleLabel.text = user.getTitleByUser()
            cardMessageLabel.text = user.getMessageByUser()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAdoptions()
    }
    

    func loadAdoptions(){
        if let user = local.getUser() {
            viewModel.getAdoptions(id: user.idUser)
        }
    }

    
    
    func setupObserver(){
        viewModel.didFinishAdoptionApprove = { response in
            self.loader?.dismiss(animated: true, completion: {
                self.showSuccessPopUp(title: App.getString(key: "alert_title_success"), description: response.message)
            })
        }
    }
    
    

    


}

extension AdoptionViewController: AdoptionDelegate, CellProtocol, PopUpSuccessProtocol, PopUpProtocol {
    func onAcceptAction() {
        let request = ApproveAdoptionRequest(idAdoption: self.idAdoption, idUser: self.idUser)
        self.loader = self.showLoader(msm: App.getString(key: "alert_msm_approve"))
        viewModel.approveAdoption(request: request)
    }
    
    func onCancelAction() {
        print("cancel")
        self.idUser = 0
        self.idAdoption = 0
    }
    
    
    func onSuccessAcceptAction() {
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
        if let usr = local.getUser() {
            if(usr.isOwner()){
                if(idAdoption != -1 && idUser != -1){
                    self.idAdoption = idAdoption
                    self.idUser = idUser
                    
                    self.showAlertPopUp(title: App.getString(key: "alert_title_confirm"), description: App.getString(key: "alert_msm_request"), showCancel: true)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdoptionTableViewCell.identifier, for: indexPath) as? AdoptionTableViewCell else{
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
        cell.statusButton.primaryRoundButton()
        cell.iconStatus.alpha = 0
     
        
        let typeUser = local.getUser()?.typeUser ?? -1

        
        
        if(typeUser == AppUtils.OWNER_ID){
            cell.userDetailLabel.text = "Quiere Adoptar"
            if(adoption.isApproved()){
                cell.statusButton.setTitle("Solicitud Aceptada", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 1
            }else{
                cell.statusButton.setTitle("Aceptar adopción", for: .normal)
                cell.statusButton.primaryRoundButton()
                cell.statusButton.isEnabled = true
                cell.iconStatus.alpha = 0
            }
        }else{
            cell.userDetailLabel.text = "Dueño"
            if(adoption.isApproved()){
                cell.statusButton.setTitle("Adopción aprobada", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 1
     
            }else{
                cell.statusButton.setTitle("Solicitud enviada", for: .normal)
                cell.statusButton.isEnabled = false
                cell.iconStatus.alpha = 0
            }
        }
       
    
        return cell
    }
    
    

    
}

extension AdoptionViewController: UITableViewDelegate{
    
}
