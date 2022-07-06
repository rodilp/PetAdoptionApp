//
//  AdoptionRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

struct AdoptionRepository{
    private let remote = AdoptionDataSource()
    
    func requestAdoption(request: AdoptionRequest, completion: @escaping  (BaseResponse?, Error?) -> Void) {
        remote.requestAdoption(request: request) { response, error in
            completion(response, error)
        }
    }
    
    
}
