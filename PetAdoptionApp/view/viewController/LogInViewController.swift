//
//  LoginViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cardBody: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    // MARK: - Injection
    var viewModel =  LogInViewModel(auhtRepository: AuthRepository())
    var local = LocalDataRepository(localData: LocalDataSource())
    var loader : UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        //verifyAuth()
        setupObserver()
    }


    
    func verifyAuth(){
        if local.getUser() != nil {
            goToMain()
        }
    }
    
    func login(){
        guard let email = emailTextField.text,
              let password = passwordTextField.text else{
                  return
              }
        viewModel.auth(rq: AuthRequest(email: email, password: password))
    }
    
    private func setupObserver(){
        
        viewModel.didFinishFetch = { response in
            if(response.data == nil){
                self.loader?.dismiss(animated: true, completion: {
                    self.showAlertPopUp(title: App.getString(key: "alert_title_error"), description: response.message, showCancel: false)
                })
                return
            }
            
            let user:User = response.data!
            self.local.saveUser(user: user)

            self.loader?.dismiss(animated: true, completion: {
                self.goToMain()
            })
        }
        
        viewModel.updateLoadingStatus = { st in
            if(st){
                self.loader = self.showLoader(msm: App.getString(key: "alert_msm_entering"))
            }
        }
        

    }


    
  
    
    func setupView(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        cardBody.roundCorners(corners: .topLeft, radius: 60)
        signInButton.primaryRoundButton()
        logoImage.roundBorder(corner: 0, round: true)
        signUpButton.secondaryButton()
        emailTextField.roundTextField()
        passwordTextField.roundTextField()
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        signInButton.bounce()
        
        login()
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
       signUpButton.bounce()
        
        let controller : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: App.StoryBoardID.signUpViewController) as! SignUpViewController
        self.navigationController?.pushViewController(controller, animated: true)
      
    }
    
    
    func goToMain(){
        let onboardingViewController = UIStoryboard(name: App.StoryBoardID.main, bundle: nil).instantiateViewController(withIdentifier: App.StoryBoardID.mainHomeViewController)
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = onboardingViewController
            window.makeKeyAndVisible()
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    

}


