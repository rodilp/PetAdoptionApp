//
//  LogInViewModel.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 27/06/22.
//

import Foundation
class LogInViewModel {
    private var dataService: AuthDataSource?
    
    
    var response: AuthResponse? {
        didSet {
            self.didFinishFetch?(response!)
        }
    }
    
    
     var isLoading: Bool = false {
         didSet { self.updateLoadingStatus?(isLoading) }
     }
    
    
    
    // MARK: - Closures for callback
    var updateLoadingStatus: ((_ st:Bool) -> ())?
    var didFinishFetch: ((_ res:AuthResponse) -> ())?
    
    init(dataService: AuthDataSource) {
            self.dataService = dataService
        }
    
    
    func auth(rq:AuthRequest){
        self.isLoading = true
        self.dataService?.auth(request: rq, completion: { response,error  in
            if error != nil {
                            self.isLoading = false
                            return
                        }
            self.isLoading = false
            self.response  = response
        })
        
    }
    

    
    
    
    
}
