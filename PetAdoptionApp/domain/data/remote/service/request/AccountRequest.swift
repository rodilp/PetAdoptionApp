//
//  AccountRequest.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation

struct AccountRequest: Encodable {
    let fullName:String
    let email:String
    let password:String
    
    init(fullName:String, email:String, password:String){
        self.fullName = fullName
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey{
        case fullName
        case email
        case password
    }
    
    init(from decoder:Decoder) throws {
       let values =  try decoder.container(keyedBy: CodingKeys.self)
        self.fullName = try values.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        self.email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.password = try values.decodeIfPresent(String.self, forKey: .password) ?? ""

   }
    
}
