//
//  SegundoViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class AdoptionViewController: UIViewController, CellProtocol {
 
    

    @IBOutlet weak var adoptionTableView: UITableView!
    @IBOutlet weak var cardMessage: UIView!
    
    let viewModel = AdoptionViewModel(adoptionRepository: AdoptionDataSource())
    var adoptions : [Adoption] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPerfil()
        
        adoptionTableView.delegate = self
        adoptionTableView.dataSource = self
        viewModel.delegate = self
        
       

    }
    
    override func viewDidAppear(_ animated: Bool) {
       print("ENtrango.....")
    }
    
    
    
    func getPerfil(){
        if let user = LocalUserRepository().getUser() {
            viewModel.getAdoptions(id: user.idUser)
        }
 
    }
    
    func accepAction(action: Bool) {
        print("Callback:::: \(action)")
    }


}

extension AdoptionViewController: AdoptionDelegate{
    func getAdoptions(adoptions: [Adoption]) {
        print(adoptions)
        self.adoptions = adoptions
        adoptionTableView.reloadData()
        
        if(adoptions.isEmpty){
            cardMessage.isHidden = false
        }else{
            cardMessage.isHidden = true
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
        
        cell.petNameLabel.text = adoption.pet.name
        cell.petRaceLabel.text = adoption.pet.race
        cell.petImage.loadImage(url: adoption.pet.images[0].url)
        
        
        var image = UIImage()
        if(adoption.pet.sex == AppUtils.MALE){
            image = UIImage(named: "icon_male")!
        }else{
            image = UIImage(named: "icon_female")!
        }
        let imageView = UIImageView(image: image)
        cell.petSexLogo.image = imageView.image
        
        cell.userImage.loadImage(url: adoption.user.image)
        cell.userNameLabel.text = adoption.user.fullName
        cell.userDetailLabel.text = "Quiere Adoptar"
        
        cell.statusButton.roundButton()
     
        cell.petNameLabel.titleColor()
        cell.petRaceLabel.detailColor()
        cell.userNameLabel.titleColor()
        cell.userDetailLabel.detailColor()
        cell.petImage.roundBorder(corner: 15, round: false)
        cell.userImage.roundBorder(corner: 0, round: true)

        return cell
    }
    
    
}

extension AdoptionViewController: UITableViewDelegate{
    
}
