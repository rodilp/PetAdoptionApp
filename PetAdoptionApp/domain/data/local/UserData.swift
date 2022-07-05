//
//  UserProfile.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation

protocol UserProtocol{
    func saveUser(user:User)
    func getUser() -> User?
}

struct UserData : UserProtocol{
    
    func saveUser(user: User) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(user, forKey: "key_user_profile")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getUser() -> User? {
        let userDefaults = UserDefaults.standard
        if let user = try?  userDefaults.getObject(forKey: "key_user_profile", castTo: User.self){
            return user
        }
        return nil
    }
    
    
}
