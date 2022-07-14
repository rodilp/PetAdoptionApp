//
//  HomeRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation
import Alamofire



class PetDataSource{
    static let shared = PetDataSource()
    private init() {}
    
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> Void) {
        let api = ApiUtils.apiCategory.getService()
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }

            if let catResponse = try? JSONDecoder().decode(CategoryResponse.self, from: response.data!){
                print(catResponse)
                completion(catResponse, nil)
            }
        }
    }
    
    func getPets(completion: @escaping (PetResponse?, Error?) -> Void) {
        let api = ApiUtils.apiPets.getService()
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
 
            if let petResponse = try? JSONDecoder().decode(PetResponse.self, from: response.data!){
                print(petResponse)
                completion(petResponse, nil)
            }
                
          
        }
    }
    
    func getPetByCategory(id:Int, completion: @escaping (PetResponse?, Error?) -> Void) {
        let api = ApiUtils.apiPetByCategory.getService() + String(id)
        print(api)
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
       
            if let petResponse = try? JSONDecoder().decode(PetResponse.self, from: response.data!) {
                print(petResponse)
                completion(petResponse, nil)
            }
                
           
        }
    }
    
    func getPetById(id:Int, completion: @escaping (PetProfileResponse?, Error?) -> Void) {
        let api = ApiUtils.apiPetById.getService() + String(id)
        
        AF.request(api, method: .get, headers: nil).response { response in
            
            print(response)
            
            if let  error = response.error {
                completion(nil, error)
                return
            }
           
            if let petResponse = try? JSONDecoder().decode(PetProfileResponse.self, from: response.data!){
                print(petResponse)
                completion(petResponse, nil)
            }
                
          
        }
    }
    
    
    
    
}
