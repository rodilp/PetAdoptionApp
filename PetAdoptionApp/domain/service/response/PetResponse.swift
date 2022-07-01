//
//  PetResponse.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 29/06/22.
//

import Foundation

struct PetResponse: Codable{
    let code:Int
    let message:String
    let data:[Pet]
}
