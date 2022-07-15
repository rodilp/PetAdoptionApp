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
    
    let viewModel = SignUpViewModel(auhtRepository: AuthRepository())
    var loader : UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupObserver()
        setupLister()
       
    }
    
    func setupObserver(){
        
        viewModel.onSuccessRegister = { response in
            self.loader?.dismiss(animated: true, completion: {
                self.cleanInputs()
                self.showSuccessPopUp(title: App.getString(key: "alert_title_success"), description: response.message)
            })
        }
        
        viewModel.onAlertRegister = { message in
            self.loader?.dismiss(animated: true, completion: {
                self.showAlertPopUp(title: App.getString(key: "alert_title_error"), description: message, showCancel: false)
            })
        }
        
        viewModel.onError = {
            self.loader?.dismiss(animated: true, completion: {
                self.showAlertPopUp(title: App.getString(key: "alert_title_error"), description: App.getString(key: "msms_server_error"), showCancel: false)
   
            })
            
        }
    }
    
    func setupLister(){
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.back(_:)))
        cardBackBackground.addGestureRecognizer(gesture)
    }
    
    @objc private func back(_ sender:UITapGestureRecognizer){
        navigationController?.popViewController(animated: true)
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
        createAccountButton.primaryRoundButton()
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        createAccountButton.bounce()
        
        let fullName = fullNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repassword = confirmPasswordTextField.text ?? ""
        
        if(fullName.isEmpty || email.isEmpty || password.isEmpty || repassword.isEmpty){
            self.presentAlert(withTitle: App.getString(key: "alert_title_error"), message: App.getString(key: "msm_empty_inputs"))
            return
        }
        
        if(password != repassword){
            self.presentAlert(withTitle: App.getString(key: "alert_title_error"), message: App.getString(key: "msm_pasword"))
            return
        }
        
        self.loader = self.showLoader(msm: App.getString(key: "alert_msm_create"))
        let account = AccountRequest(fullName: fullName, email: email, password: password)
        viewModel.createAccount(rq: account)
        
    }
    
    func cleanInputs(){
        fullNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    


    
    

}
