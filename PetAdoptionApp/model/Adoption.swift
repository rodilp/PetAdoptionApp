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
}
