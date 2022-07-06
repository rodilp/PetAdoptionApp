//
//  AuthRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

struct AuthRepository{
    private let remote = AuthDataSource()
    
    func createAccount(request: AccountRequest, completion: @escaping (AuthResponse?, Error?) -> Void){
        remote.createAccount(request: request) { response, error in
            completion(response,error)
        }
    }
    
    func auth(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> Void ){
        remote.auth(request: request) { response, error in
            completion(response, error)
        }
    }
}
