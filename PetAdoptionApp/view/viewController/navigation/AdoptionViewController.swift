//
//  SegundoViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class AdoptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        getPerfil()
    }
    
    func getPerfil(){
        if let user = UserProfileRepository().getUser() {
            print("USER::::",user)
        }
 
    }
    
    

    



}
