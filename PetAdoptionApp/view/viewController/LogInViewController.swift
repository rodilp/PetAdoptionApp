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
    @IBOutlet weak var cardBody: UIView!
    
    // MARK: - Injection
    
    
    var viewModel =  LogInViewModel(auhtRepository: AuthRepository())
    var local = LocalDataRepository(localData: LocalDataSource())
    
    var loader : UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        //verifyAuth()

        //let authRepository = AuthRepository(dataSoruce: AuthDataSource())
       // viewModel =  LogInViewModel(auhtRepository: authRepository)
        
        setupObserver()
        print("Main:::LOGIN")
       
    }


    
    func verifyAuth(){
        if local.getUser() != nil {
            goToMain()
        }
    }
    
    func login(){
        guard let email = emailTextField.text,
              let password = passwordTextField.text else{
                  print("Empty inputs")
                  return
              }
    
        viewModel.auth(rq: AuthRequest(email: email, password: password))
    }
    
    private func setupObserver(){
        
        viewModel.didFinishFetch = { response in
            if(response.data == nil){
                self.loader?.dismiss(animated: true, completion: {
                    self.showAlertPopUp(title: NSLocalizedString("alert_title_error", comment: ""), description: response.message, showCancel: false)
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
                self.loader = self.showLoader(msm: NSLocalizedString("alert_msm_entering", comment: ""))
            }
            
        }
        
        viewModel.error.observe { error in
            print("New Observer: \(String(describing: error))")
        }
    }


    
    func setupView(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        cardBody.roundCorners(corners: .topLeft, radius: 60)
        signInButton.primaryRoundButton()
        emailTextField.roundTextField()
        passwordTextField.roundTextField()
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        signInButton.bounce()
        
        login()
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let controller : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(controller, animated: true)
      
    }
    
    
    func navigateMainStoryBoard(){
        if let vc = UIStoryboard(name: MainTabBarViewController.name, bundle: nil).instantiateViewController(withIdentifier: "MainTBC") as? MainTabBarViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
    
    func goToRegister(){
        let story = UIStoryboard(name: "LogIn", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()

    }

    

}


