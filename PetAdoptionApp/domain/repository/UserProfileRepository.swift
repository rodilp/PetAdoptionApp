//
//  UserProfileRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation

struct UserProfileRepository {
    let data = UserData()
    
    func getUser() -> User? { return data.getUser() }
    func saveUser(user:User){ data.saveUser(user: user) }
    
}
