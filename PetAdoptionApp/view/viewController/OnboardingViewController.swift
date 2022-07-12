//
//  OnboardingViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 12/07/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    
    let local = LocalDataRepository(localData: LocalDataSource())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        // Do any additional setup after loading the view.
       checkAuth()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func checkAuth(){
        if let setting = local.getSetting() {
            if(setting.isLauchApp){
                let user  = local.getUser()
                if user != nil {
                    goToMain()
                }else{
                    goToLogin()
                }
            }
        }
    }
    
    func setupView(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        titleLabel.titleColor()
        detailLabel.detailColor()
        buttonStart.startButton()
        
    }
    
    @IBAction func start(_ sender: UIButton) {
        buttonStart.bounce()
        local.saveSettign(sett: Setting(isLaunchApp: true))
        goToLogin()
    }
    
    func goToLogin(){
        let story = UIStoryboard(name: "LogIn", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "LoginNavigationController") as! LoginNavigationController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func navigateMainStoryBoard(){
        if let vc = UIStoryboard(name: MainTabBarViewController.name, bundle: nil).instantiateViewController(withIdentifier: "MainTBC") as? MainTabBarViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func goToMain(){
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "MainTBC") as! MainTabBarViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    

    
    

}
