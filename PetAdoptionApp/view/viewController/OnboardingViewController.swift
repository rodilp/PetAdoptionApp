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
        let story = UIStoryboard(name: App.StoryBoardID.login, bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: App.StoryBoardID.logInViewController) as! LoginNavigationController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func goToMain(){
        let story = UIStoryboard(name: App.StoryBoardID.main, bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: App.StoryBoardID.mainHomeViewController) as! MainTabBarViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    

    
    

}
