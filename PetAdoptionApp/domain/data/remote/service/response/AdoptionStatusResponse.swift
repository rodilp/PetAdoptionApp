//
//  AdoptionStatusResponse.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import Foundation
struct AdoptionStatusResponse : Codable{
    let code:Int
    let message:String
    let data:[Adoption]?
}
