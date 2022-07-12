//
//  AppDelegate.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 20/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //let module = AuthModule.setupModule()
        //window?.rootViewController = module
  /*
        let local = LocalDataRepository(localData: LocalDataSource())
        
        if let setting = local.getSetting() {
            if(setting.isLauchApp){
                let user = local.getUser()
                if user != nil {
                    navigateMainStoryBoard()
                }else{
                    goToLogin()
                }
            }
        } */
      
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    

    func goToLogin(){
        self.window?.rootViewController = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(withIdentifier: "LogInViewController")
    }
    
    func navigateMainStoryBoard(){
        self.window?.rootViewController = UIStoryboard(name: MainTabBarViewController.name, bundle: nil).instantiateViewController(withIdentifier: "MainTBC")
        }
    
    
    
    

}

