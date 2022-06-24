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
        
        navigateMainStoryBoard()

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
    
    func navigateMainStoryBoard(){
        
        
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTBC") as?
            UITabBarController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainApp") as! MainTabBarViewController
//        nextViewController.modalPresentationStyle = .fullScreen
//        self.present(nextViewController, animated:true, completion:nil)
            
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
