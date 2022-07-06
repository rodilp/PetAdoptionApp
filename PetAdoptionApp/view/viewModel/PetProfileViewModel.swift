//
//  PetProfileViewModel.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 4/07/22.
//

import Foundation

protocol PetDelegate{
    func getPet(pet:Pet)
}

class PetProfileViewModel{
    
    var delegate : PetDelegate?
    private var repo: PetDataSource?
    let adoptionRepository = AdoptionRepository()
    
    init(repo: PetDataSource) {
        self.repo = repo
    }
    
    var didFinishAdoptionRequest:((_ res:BaseResponse) -> Void)?
    var response: BaseResponse? {
        didSet {
            self.didFinishAdoptionRequest?(response!)
        }
    }
    
    
    func getPetById(id:Int){
        repo?.getPetById(id: id, completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let pet = response?.data
                self.delegate?.getPet(pet: pet!)
                return
            }
        })
    }
    
    func requestAdoption(request:AdoptionRequest){
        adoptionRepository.requestAdoption(request: request) { response, error in
            if error != nil {
                return
            }
            if(response?.code == HttpUtil.OK){
                self.response = response
                return
            }
            
        }
        
    }
    
    
    
}
