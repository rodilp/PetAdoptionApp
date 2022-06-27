//
//  AuthRequest.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation


struct AuthRequest :Encodable {
    let email:String
    let password:String
    
    init(email:String, password:String){
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey{
        case email
        case password
    }
    
     init(from decoder:Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
         self.email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
         self.password = try values.decodeIfPresent(String.self, forKey: .password) ?? ""

    }
    
    
}
