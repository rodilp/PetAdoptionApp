//
//  AuthResponse.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation

struct AuthResponse: Decodable{
    let code:Int
    let message:String
    let data:User?
    
    enum CodingKeys: String, CodingKey{
        case code
        case message
        case data
    }
    
     init(from decoder:Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
         self.code = try values.decodeIfPresent(Int.self, forKey: .code) ?? 0
         self.message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
         self.data = try values.decodeIfPresent(User.self, forKey: .data) ?? nil
    }
}
