//
//  PetRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation
protocol PetRepositoryProtocol{
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> Void)
    func getPets(completion: @escaping (PetResponse?, Error?) -> Void)
    func getPetByCategory(id:Int, completion: @escaping (PetResponse?, Error?) -> Void)
    func getPetById(id:Int, completion: @escaping (PetProfileResponse?, Error?) -> Void)
}

class PetRepository:PetRepositoryProtocol{
    
    private let service = PetDataSource.shared
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> Void) {
        service.getCategories { response, error in
            completion(response, error)
        }
    }
    
    func getPets(completion: @escaping (PetResponse?, Error?) -> Void) {
        service.getPets { response, error in
            completion(response, error)
        }
    }
    
    func getPetByCategory(id:Int, completion: @escaping (PetResponse?, Error?) -> Void) {
        service.getPetByCategory(id: id) { response, error in
            completion(response, error)
        }
    }
    
    func getPetById(id:Int, completion: @escaping (PetProfileResponse?, Error?) -> Void) {
        service.getPetById(id: id) { response, error in
            completion(response, error)
        }
    }
    
}
