//
//  CategoryResponse.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation
struct CategoryResponse: Codable{
    let code:Int
    let message:String
    let data:[Category]
}
