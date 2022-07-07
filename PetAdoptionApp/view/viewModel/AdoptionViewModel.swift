//
//  AdoptionViewModel.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import Foundation
protocol AdoptionDelegate{
    func getAdoptions(adoptions:[Adoption])
}

class AdoptionViewModel {
    var delegate: AdoptionDelegate?
    
    private var adoptionRepository: AdoptionProtocol?
    
    init(adoptionRepository: AdoptionProtocol) {
        self.adoptionRepository = adoptionRepository
    }
    
    func getAdoptions(id:Int){
        adoptionRepository?.adoptionStatus(id: id, completion: { response, error in
            
            if(response?.code == HttpUtil.OK){
                let listAdoption = response?.data ?? []
                self.delegate?.getAdoptions(adoptions: listAdoption)
            }
            
        })
    
    }
    
}
