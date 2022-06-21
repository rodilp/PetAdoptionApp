//
//  ViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 20/06/22.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var buttonOulet: UIButton!
    
    @IBAction func button1() {
        buttonOulet.jump()
       print("Press..")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonOulet.round()

    }


}

