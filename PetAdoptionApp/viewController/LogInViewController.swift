//
//  LoginViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController, PopUpProtocol {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var cardBody: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        testRequest()

    }
    
    func testRequest(){
        AF.request("https://petadoptionapi.herokuapp.com/apiv1/user").response { res in
            debugPrint(res)
            
        }
    }

    
    func setupView(){
        cardBody.roundCorners(corners: .topLeft, radius: 60)
        signInButton.roundButton()
        emailTextField.roundTextField()
        passwordTextField.roundTextField()
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        signInButton.bounce()
        //navigateMainStoryBoard()
        //ErrorPopUpViewController.showPopup(parentVc: self)
        
        //LoadingPopUpViewController.showPopup(parentVc: self, msm: "cd..")
        let loading = LoadingPopUpViewController()
        loading.showPopup(parentVc: self, msm: "Carn...")

    }
    @IBAction func SignUp(_ sender: Any) {
        let controller : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func navigateOtherStoryBoard(){
        let nextStory = UIStoryboard(name: "SignUp", bundle: nil)
        let viewC = nextStory.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    
    func navigateMainStoryBoard(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTBC") as? UITabBarController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
            
    }
    
    
    func accepAction(action: Bool) {
        print("Acept Pressed..")
    }
    
    
    
}