//
//  App.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 12/07/22.
//

import Foundation
struct App{
    
    struct Segue{
        
    }
    
    struct StoryBoardID{
        static let login = "LogIn"
        static let main = "Main"
        static let onboardingViewController = "OnboardingViewController"
        static let logInViewController = "LogInViewController"
        static let signUpViewController = "SignUpViewController"
        static let loginNavigationViewController = "LoginNavigationController"
        static let mainHomeViewController  = "MainTBC"
        static let petprofileViewController = "PetProfileViewController"
    }
    
    static func getString(key:String) -> String{
        return NSLocalizedString(key, comment: "")
    }
}
