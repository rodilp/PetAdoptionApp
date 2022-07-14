//
//  AuthRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

protocol AuthRepositoryProtocol{
    func createAccount(request: AccountRequest, completion: @escaping (AuthResponse?, Error?) -> Void)
    func auth(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> Void )
    
}

class AuthRepository: AuthRepositoryProtocol{
    
    let service = AuthDataSource.shared

    func createAccount(request: AccountRequest, completion: @escaping (AuthResponse?, Error?) -> Void){
        service.createAccount(request: request) { response, error in
            completion(response,error)
        }
    }
    
    func auth(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> Void ){
        service.auth(request: request) { response, error in
            completion(response, error)
        }
    }
}
