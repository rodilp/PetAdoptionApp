//
//  SegundoViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class AdoptionViewController: UIViewController, CellProtocol {
 
    

    @IBOutlet weak var adoptionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPerfil()
        
        adoptionTableView.delegate = self
        adoptionTableView.dataSource = self
        
        

    }
    
    
    
    func getPerfil(){
        if let user = LocalUserRepository().getUser() {
            print("USER::::",user)
        }
 
    }
    
    func accepAction(action: Bool) {
        print("Callback:::: \(action)")
    }
    
    

    



}


extension AdoptionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdoptionTableViewCell", for: indexPath) as? AdoptionTableViewCell else{
            return UITableViewCell()
        }
        
        cell.petNameLabel.text = "Gaaaa"
        cell.delegate = self
        
        return cell
    }
    
    
}

extension AdoptionViewController: UITableViewDelegate{
    
}
