//
//  DataService.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation
import Alamofire


struct DataService {
    
    static let shared = DataService()

    
    func auth2(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> () ){
        

        let api = ApiUtils.BASE_URL + ApiUtils.apiAuth
        let params: Parameters = ["email": "\(request.email)","password": "\(request.password)"]
        print("request:: \(params)")
    
        AF.request(api, method: .get, parameters:params , encoding: JSONEncoding.default, headers: nil).response { response in
            
            if let  error = response.error {
                completion(nil, error)
                return
            }
            
            do {
                debugPrint(response)
        
                let usr = try JSONDecoder().decode(AuthResponse.self, from: response.data!)
                print(usr)
                completion(usr, nil)
            }catch let err  as NSError{
                print("Error:: \(err)")
                
            }
            
    
        }
        
      
    }
    
    
    func auth(request: AuthRequest, completion: @escaping (AuthResponse?, Error?) -> () ){
        
        var memberJson : String = ""
        let api = ApiUtils.BASE_URL + ApiUtils.apiAuth
        
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(request)
            memberJson = String(data: jsonData, encoding: String.Encoding.utf8)!
               
           }catch{}
        
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
               
               do {
                   let usr = try JSONDecoder().decode(AuthResponse.self, from: response.data!)
                   //print(usr)
                   completion(usr, nil)
                   
               }catch let err  as NSError{
                   print("Error:: \(err)")
                   
               }
               
           }
                                    
                                    
    }
    
    
    
    
}

