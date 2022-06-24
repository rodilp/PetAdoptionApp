//
//  SignUpViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var cardBackBackground: UIView!
    @IBOutlet weak var cardBodyView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBAction func createAccount(_ sender: Any) {
        createAccountButton.bounce()
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        //self.navigationItem.leftBarButtonItem =
         //   UIBarButtonItem(image:StyleKit.imageOfMap, style:.Plain, target:self, action:nil);
    }
    
    
    func setupView(){
        //hide back press
        self.navigationItem.setHidesBackButton(true, animated: true)
        cardBackBackground.roundView()
        cardBodyView.roundCorners(corners: .topLeft, radius: 60)
        
        
        fullNameTextField.roundTextField()
        emailTextField.roundTextField()
        passwordTextField.roundTextField()
        confirmPasswordTextField.roundTextField()
        createAccountButton.roundButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
