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
    
    
    var viewModel : LogInViewModel?
    var local = LocalDataRepository(localData: LocalDataSource())
    
    var loader : UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        verifyAuth()

        let authRepository = AuthRepository(dataSoruce: AuthDataSource())
        viewModel =  LogInViewModel(auhtRepository: authRepository)
        
       
    }

    
    override func viewDidAppear(_ animated: Bool) {
        setupObserver()
    }
    
    func verifyAuth(){
        if local.getUser() != nil {
            navigateMainStoryBoard()
        }
    }
    
    func login(email:String, pass:String){
        let request = AuthRequest(email: email, password: pass)
        self.loader = self.showLoader(msm: NSLocalizedString("alert_msm_entering", comment: ""))
        viewModel?.auth(rq: request)
    }
    
    func setupObserver(){
        
        viewModel?.didFinishFetch = { response in
            if(response.data == nil){
                self.loader?.dismiss(animated: true, completion: {
                    self.showAlertPopUp(title: NSLocalizedString("alert_title_error", comment: ""), description: response.message, showCancel: false)
                })
                return
            }
            
            let user:User = response.data!
            self.local.saveUser(user: user)

            self.loader?.dismiss(animated: true, completion: {
                self.navigateMainStoryBoard()
            })
        }
        
        viewModel?.updateLoadingStatus = { st in
            if(st){
                print("cargando...")
            }
            else{
                print("terminando....")
                self.loader?.dismiss(animated: true, completion: nil)
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
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let controller : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func navigateOtherStoryBoard(){
        let nextStory = UIStoryboard(name: SignUpViewController.name, bundle: nil)
        let viewC = nextStory.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    func navigateMainStoryBoard(){
        if let vc = UIStoryboard(name: MainTabBarViewController.name, bundle: nil).instantiateViewController(withIdentifier: "MainTBC") as? UITabBarController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    

}


