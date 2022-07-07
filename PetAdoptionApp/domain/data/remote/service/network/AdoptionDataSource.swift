//
//  AdoptionDataSource.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 5/07/22.
//

import Foundation

import Foundation
import Alamofire

protocol AdoptionProtocol {
    func requestAdoption(request:AdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void)
    func approveAdoption(request:ApproveAdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void)
    func adoptionStatus(id:Int,completion: @escaping (AdoptionStatusResponse?, Error?) -> Void)
}

struct AdoptionDataSource : AdoptionProtocol {
    func adoptionStatus(id:Int, completion: @escaping (AdoptionStatusResponse?, Error?) -> Void) {
        let api = ApiUtils.apiAdoptionList.getService() + String(id)
        print(api)
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            
            do {
                let catResponse = try JSONDecoder().decode(AdoptionStatusResponse.self, from: response.data!)
                completion(catResponse, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
            }
            /*
            if let statusAdoption = try? JSONDecoder().decode(AdoptionStatusResponse.self, from: response.data!) {
                print(statusAdoption)
                completion(statusAdoption, nil)
            } */
                
           
        }
    }
    
    func approveAdoption(request: ApproveAdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void) {
        var bodyJson : String = ""
        let api = ApiUtils.apiApproveAdoption.getService()
  
        if let jsonData = try? JSONEncoder().encode(request) {
            bodyJson = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
           
        let urlComponent = URLComponents(string: api)!
        print(bodyJson)

        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyJson.data(using: .utf8)
        
        AF.request(request).response{ response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            
            if let usr = try? JSONDecoder().decode(BaseResponse.self, from: response.data!){
                completion(usr, nil)
                return
            }
        }
        
    }

    
    func requestAdoption(request: AdoptionRequest, completion: @escaping (BaseResponse?, Error?) -> Void) {
        
        var bodyJson : String = ""
        let api = ApiUtils.apiRequestAdoption.getService()
  
        if let jsonData = try? JSONEncoder().encode(request) {
            bodyJson = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
           
        let urlComponent = URLComponents(string: api)!
        print(bodyJson)

        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyJson.data(using: .utf8)
        
        AF.request(request).response{ response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            
            if let usr = try? JSONDecoder().decode(BaseResponse.self, from: response.data!){
                completion(usr, nil)
                return
            }
        }
    }
    
    

    
    
}

