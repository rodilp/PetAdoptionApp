//
//  HomeViewModel.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation


protocol CategoryDelegate{
    func getCategories(cat:[Category])
    func getPets(pets:[Pet])
}

class HomeViewModel{
    
    var delegate : CategoryDelegate?
    private var repo: HomeRepository?
    
    init(repo: HomeRepository) {
        self.repo = repo
    }
    
    func getListCategory(){
        repo?.getCategories(completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let listC = response?.data ?? []
                self.delegate?.getCategories(cat: listC)
                return
            }
            
        })
    }
    
    func getPets(){
        repo?.getPets(completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let pets = response?.data ?? []
                self.delegate?.getPets(pets: pets)
                return
            }
        })
    }
    
    
    
    
}
