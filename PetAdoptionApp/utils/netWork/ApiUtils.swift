//
//  ApiUtils.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation

struct ApiUtils{
    static let BASE_URL:String = "https://petadoptionapi.herokuapp.com"
    static let LOCAL_BASE_URL:String = "http://localhost:3000"
    
    
    static let apiAuth:String = "/apiv1/user/auth"
    static let apiCreateAccount:String = "/apiv1/user/register"
}
