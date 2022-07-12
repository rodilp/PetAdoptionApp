//
//  UserProfileRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation

class LocalDataRepository {
    
    private var localData: LocalDataProtocol?
    
    init(localData: LocalDataProtocol){
        self.localData = localData
    }

    
    func getUser() -> User? { return localData?.getUser() }
    func saveUser(user:User){ localData?.saveUser(user: user) }
    
    func getSetting() -> Setting? {return localData?.getSetting()}
    func saveSettign(sett:Setting){ localData?.saveSetting(setting: sett)}
    
    func clearLocalData(key:String){
        localData?.clearLocalData(key: key)
    }
}
