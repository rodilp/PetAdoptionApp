//
//  AdoptionRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

protocol AdoptionRepositoryProtocol {
    func requestAdoption(request:AdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void)
    func approveAdoption(request:ApproveAdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void)
    func adoptionStatus(id:Int,completion: @escaping (AdoptionStatusResponse?, Error?) -> Void)
}

class AdoptionRepository: AdoptionRepositoryProtocol{
    
    private let service = AdoptionDataSource.shared
    
    
    func approveAdoption(request: ApproveAdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void) {
        service.approveAdoption(request: request) { response, error in
            completion(response, error)
        }
    }
    
    func adoptionStatus(id: Int, completion: @escaping (AdoptionStatusResponse?, Error?) -> Void) {
        service.adoptionStatus(id: id) { response, error in
            completion(response, error)
        }
    }

    func requestAdoption(request: AdoptionRequest, completion: @escaping  (BaseResponse?, Error?) -> Void) {
        service.requestAdoption(request: request) { response, error in
            completion(response, error)
        }
    }
    
    
}
