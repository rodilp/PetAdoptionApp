//
//  AdoptionRequest.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

struct AdoptionRequest: Encodable {
    let idUser:Int
    let idPet:Int
    
    init( _ idUser:Int, _ idPet:Int){
        self.idUser = idUser
        self.idPet = idPet
    }
}
