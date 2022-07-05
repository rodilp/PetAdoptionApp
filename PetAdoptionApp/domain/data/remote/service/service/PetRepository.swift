//
//  HomeRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation
import Alamofire

struct PetRepository{
    
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> () ){
        let api = ApiUtils.apiCategory.getService()
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            do {
                let catResponse = try JSONDecoder().decode(CategoryResponse.self, from: response.data!)
                print(catResponse)
                completion(catResponse, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
            }
        }
    }
    
    func getPets(completion: @escaping (PetResponse?, Error?) -> () ){
        let api = ApiUtils.apiPets.getService()
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            do {
                let petResponse = try JSONDecoder().decode(PetResponse.self, from: response.data!)
                print(petResponse)
                completion(petResponse, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
            }
        }
    }
    
    func getPetByCategory(id:Int, completion: @escaping (PetResponse?, Error?) -> () ){
        let api = ApiUtils.apiPetByCategory.getService() + String(id)
        print(api)
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            do {
                let petResponse = try JSONDecoder().decode(PetResponse.self, from: response.data!)
                print(petResponse)
                completion(petResponse, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
            }
        }
    }
    
    
    func getPetById(id:Int, completion: @escaping (PetProfileResponse?, Error?) -> () ){
        let api = ApiUtils.apiPetById.getService() + String(id)
        
        AF.request(api, method: .get, headers: nil).response { response in
            if let  error = response.error {
                completion(nil, error)
                return
            }
            do {
                let petResponse = try JSONDecoder().decode(PetProfileResponse.self, from: response.data!)
                print(petResponse)
                completion(petResponse, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
            }
        }
    }
    
    
    
    
    
    
    
}
