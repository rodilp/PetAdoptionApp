//
//  HomeRepository.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation
import Alamofire

struct HomeRepository{
    
    func getCategories(completion: @escaping (CategoryResponse?, Error?) -> () ){
        let api = ApiUtils.BASE_URL + ApiUtils.apiCategory
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
        let api = ApiUtils.BASE_URL + ApiUtils.apiPets
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
        let api = ApiUtils.BASE_URL + ApiUtils.apiPetByCategory + String(id)
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
    
    
    
    
    
    
    
}
