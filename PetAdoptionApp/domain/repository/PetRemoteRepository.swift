//
//  PetRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 29/06/22.
//

import Foundation

protocol PetRepository{
    func getPets() -> PetResponse?
}


class PetRemoteRepository: PetRepository{
    
    func getPets() -> PetResponse? {
        let response = PetResponse(code: 1, message: "Success", data:[])
        return response
    }
    
    
}
