//
//  ApiUtils.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation

struct ApiUtils{
    
    //API
    static let PROD_BASE_URL:String = "https://petadoptionapi.herokuapp.com"
    static let QA_BASE_URL:String = "http://localhost:3000"
    
    //LOGIN
    static let apiAuth:String = "/apiv1/user/auth"
    static let apiCreateAccount:String = "/apiv1/user/register"
    
    //CATEGORY
    static let apiCategory:String = "/apiv1/category"
    
    //PET
    static let apiPets:String = "/apiv1/pet"
    static let apiPetById:String = "/apiv1/pet/"
    static let apiPetByCategory:String = "/apiv1/pet/category/"
    
    //ADOPTION
    static let apiRequestAdoption:String = "/apiv1/adoption/send"
    static let apiApproveAdoption:String = "/apiv1/adoption/approve"
    static let apiAdoptionList:String = "/apiv1/adoption/status/"
    
    
    
}


