//
//  DataService.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation
import Alamofire


class AuthDataSource {
    static let shared = AuthDataSource()
    
    private init() {}
    
    func createAccount(request: AccountRequest, completion: @escaping (AuthResponse?, Error?) -> Void) {
        var memberJson : String = ""
        let api = ApiUtils.apiCreateAccount.getService()
 
        if let jsonData = try? JSONEncoder().encode(request) {
            memberJson = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
        
        let urlComponent = URLComponents(string: api)!
        print(memberJson)
        
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = memberJson.data(using: .utf8)
        
        AF.request(request).response{ response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
               
            if let usr = try? JSONDecoder().decode(AuthResponse.self, from: response.data!) {
                completion(usr, nil)
            }
        }
    }
    
    
    func auth(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> Void) {
        var memberJson : String = ""
        let api = ApiUtils.apiAuth.getService()
        
        if let jsonData = try? JSONEncoder().encode(request) {
            memberJson = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
        
        let urlComponent = URLComponents(string: api)!
        print(memberJson)

        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = memberJson.data(using: .utf8)
        
        AF.request(request).response{ response in
                
            if let  error = response.error {
                completion(nil, error)
                return
            }
               
        
            if let usr = try? JSONDecoder().decode(AuthResponse.self, from: response.data!){
                completion(usr, nil)
            }
        }
    }
    

    
}

