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
    private var repo: HomeRepository?
    
    init(repo: HomeRepository) {
        self.repo = repo
    }
    
    
    var didFinishPet:((_ res:Pet) -> ())?
    
    var pet: Pet? {
        didSet {
            self.didFinishPet?(pet!)
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
    
    
    
}
