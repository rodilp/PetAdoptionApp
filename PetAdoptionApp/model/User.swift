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
    let createdAt:String
    
    enum CodingKeys: String, CodingKey{
        case idUser
        case fullName
        case email
        case image
        case createdAt = "createdAt"
    }
    
     init(from decoder:Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
         self.idUser = try values.decodeIfPresent(Int.self, forKey: .idUser) ?? 0
         self.fullName = try values.decodeIfPresent(String.self, forKey: .fullName) ?? ""
         self.email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
         self.image = try values.decodeIfPresent(String.self, forKey: .image) ?? ""
         self.createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
    }
    
    
}
