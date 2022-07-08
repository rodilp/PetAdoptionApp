//
//  UserProfile.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation

protocol LocalDataProtocol{
    func saveUser(user:User)
    func getUser() -> User?
    
    func saveSetting(setting: Setting)
    func getSetting()  -> Setting?
}

struct LocalDataSource : LocalDataProtocol{
    
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
    
    
    
    
    func saveSetting(setting: Setting) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(setting, forKey: "key_setting")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getSetting() -> Setting? {
        let userDefaults = UserDefaults.standard
        if let setting = try?  userDefaults.getObject(forKey: "key_setting", castTo: Setting.self){
            return setting
        }
        return nil
    }
    
}
