//
//  PetRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

struct PetRepository{
    private let remote = PetDataSource()
    
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> Void) {
        remote.getCategories { response, error in
            completion(response, error)
        }
    }
    
    func getPets(completion: @escaping (PetResponse?, Error?) -> Void) {
        remote.getPets { response, error in
            completion(response, error)
        }
    }
    
    func getPetByCategory(id:Int, completion: @escaping (PetResponse?, Error?) -> Void) {
        remote.getPetByCategory(id: id) { response, error in
            completion(response, error)
        }
    }
    
    func getPetById(id:Int, completion: @escaping (PetProfileResponse?, Error?) -> Void) {
        remote.getPetById(id: id) { response, error in
            completion(response, error)
        }
    }
    
}
