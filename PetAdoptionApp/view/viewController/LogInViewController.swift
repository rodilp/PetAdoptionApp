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
    
    // MARK: - Injection
    let viewModel = LogInViewModel(dataService: LoginRepository())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    
    func login(email:String, pass:String){
        let request = AuthRequest(email: email, password: pass)
        let loader = self.showLoader(msm: "Ingresando...")
        
        viewModel.auth(rq: request)
        
        viewModel.didFinishFetch = { response in
            
            if(response.data == nil){
                loader.dismiss(animated: true, completion: {
                    ErrorPopUpViewController.showPopup(parentVc: self)
                })
                return
            }
            
            loader.dismiss(animated: true, completion: {
                // save user Data
                self.navigateMainStoryBoard()
            })
           
        }
        
        viewModel.updateLoadingStatus = { st in
            if(st){
                print("cargando...")
            }
            else{
                print("terminando....")
                loader.dismiss(animated: true, completion: nil)
                    
            }
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
        
        login(email: emailTextField.text ?? "", pass: passwordTextField.text ?? "" )
        
       //let loading = LoadingPopUpViewController()
       //loading.showPopup(parentVc: self, msm: "Carn...")

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
