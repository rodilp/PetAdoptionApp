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
    
    let viewModel = SignUpViewModel(repo: AuthDataSource())
    var loader : UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupObserver()
       
    }
    
    func setupObserver(){
        
        viewModel.onSuccessRegister = { response in
            self.loader?.dismiss(animated: true, completion: {
                self.cleanInputs()
                self.showSuccessPopUp(title: "¡Felicitaciones!", description: response.message)

            })
        }
        
        viewModel.onAlertRegister = { message in
            self.loader?.dismiss(animated: true, completion: {
                self.showAlertPopUp(title: "¡Ups!", description: message, showCancel: false)

            })
        }
        
        viewModel.onError = {
            self.loader?.dismiss(animated: true, completion: {
                self.showAlertPopUp(title: "¡Ups!", description: "Ocurrio un error con el servidor", showCancel: false)
   
            })
            
        }
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
    
    
    @IBAction func createAccount(_ sender: Any) {
        createAccountButton.bounce()
        
        let fullName = fullNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repassword = confirmPasswordTextField.text ?? ""
        
        
        
        if(fullName.isEmpty || email.isEmpty || password.isEmpty || repassword.isEmpty){
            self.presentAlert(withTitle: "Ups!", message: "Es necesario ingresar todos los campos")
            return
        }
        
        if(password != repassword){
            self.presentAlert(withTitle: "Ups!", message: "Las contraseñas no son iguales, verifique porfavor!")
            return
        }
        
        self.loader = self.showLoader(msm: "creando...")
        let account = AccountRequest(fullName: fullName, email: email, password: password)
        viewModel.createAccount(rq: account)
        
    }
    
    func cleanInputs(){
        fullNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    

    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    

}
