//
//  SignUpViewModel.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import Foundation

class SignUpViewModel {
    private var repo: LoginRepository?
    
    init(repo: LoginRepository) {
            self.repo = repo
    }
    
    
    // callbacks
    var onAlertRegister: ((_ st:String) -> ())?
    var onSuccessRegister: ((_ st:AuthResponse) -> ())?
    var onError : (() -> ())?
    
    
    var isError: Bool = false {
        didSet { self.onError?() }
    }
    
    var isNotSuccess: String = "" {
        didSet {self.onAlertRegister?(isNotSuccess)}
    }
    
    var isSuccess: AuthResponse? {
        didSet {self.onSuccessRegister?(isSuccess!)}
    }
    
    

    func createAccount(rq:AccountRequest){
        
        self.repo?.createAccount(request: rq, completion: { response,error  in
            if error != nil {
                self.isError = true
                return
            }
            
            if(response?.code == HttpUtil.OK){
                self.isNotSuccess = response?.message ?? ""
                return
            }
            
            if(response?.code == HttpUtil.CREATED){
                self.isSuccess = response!
                return
            }

            
        })
        
    }
    
    
}
