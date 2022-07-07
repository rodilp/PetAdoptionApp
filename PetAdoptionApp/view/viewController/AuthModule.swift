//
//  AuthModule.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import Foundation
import UIKit

class AuthModule {
    
    static func setupModule() -> UIViewController{
        
        //let dataSource = AuthDataSource()
        
        //let repository = AuthRepository(dataSoruce: dataSource)
        
        //let viewModel = LogInViewModel(auhtRepository: repository)
        
        let storyBoard = UIStoryboard(name: "LogIn", bundle: nil)
        let uiViewController = storyBoard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        
       // uiViewController.setupViewModel(viewModel: viewModel)
        
        return uiViewController
        
    }
}
