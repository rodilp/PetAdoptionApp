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
        if(typeUser == AppUtils.OWNER_ID){
            return true
        } else {
            return false
        }
    }
    
    
    func getMessageByUser() -> String {
        if(typeUser == AppUtils.OWNER_ID){
            return "No tienes solicitudes"
        }else{
            return  "No tienes adopciones"
        }
    }
    
    func getTitleByUser() -> String {
        if(typeUser == AppUtils.OWNER_ID){
            return "Mis Solicitudes"
        }else{
            return "Mis Adopciones"
        }

    }
}
