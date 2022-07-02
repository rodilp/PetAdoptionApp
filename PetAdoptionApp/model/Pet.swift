//
//  Pet.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 29/06/22.
//

import Foundation
struct Pet: Codable{
    let idPet:Int
    let name:String
    let age:Int
    let ageTime:String
    let sex:String
    let race:String
    let address:String
    let description:String
    let images:[Image]
}
