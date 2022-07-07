//
//  User.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation


struct User : Codable {
    let idUser:Int
    let fullName:String
    let email:String
    let image:String
    let typeUser:Int
    let createdAt:String
    
    
    func isOwner() -> Bool{
        return (typeUser == 2) ? true : false
    }
    
}
