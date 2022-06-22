//
//  LoginViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!

    
    @IBAction func signIn(_ sender: Any) {
        signInButton.bounce()
        
        print("Goooo....1")

    }
    @IBAction func SignUp(_ sender: Any) {

        let controller : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBOutlet weak var cardBody: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

    }
    
    func setupView(){
        cardBody.roundCorners(corners: .topLeft, radius: 60)

        signInButton.roundButton()
        emailTextField.roundTextField()
        passwordTextField.roundTextField()
        

    }
    func navigateOtherStoryBoard(){
        let nextStory = UIStoryboard(name: "SignUp", bundle: nil)
        let viewC = nextStory.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(viewC, animated: true)
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
