//
//  PetProfileResponse.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation
struct PetProfileResponse:Codable{
    let code:Int
    let message:String
    let data:Pet
}
