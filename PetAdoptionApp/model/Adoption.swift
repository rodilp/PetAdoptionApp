//
//  Adoption.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import Foundation
struct Adoption:Codable{
    let idReq:Int
    let approveStatus:Int
    let pet:Pet
    let user:User
    
    func isOwner() -> Bool {
        if(user.typeUser == 2){
            return true
        }
        return false
    }
    
    func isApproved() -> Bool {
        return (approveStatus == 1) ? true : false
    }
}
