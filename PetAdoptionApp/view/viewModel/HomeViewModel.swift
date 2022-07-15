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
    private var repo: PetRepositoryProtocol?
    
    init(repo: PetRepositoryProtocol) {
        self.repo = repo
    }
    
    var isLoading: Bool = false {
        didSet { self.loadingStatus?(isLoading) }
    }
    
    var loadingStatus: ((_ st:Bool) -> ())?
  
    
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
        self.isLoading = true
        repo?.getPets(completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let pets = response?.data ?? []
                self.delegate?.getPets(pets: pets)
                self.isLoading = false
                return
            }
        })
    }
    
    func getPetsByCategory(id:Int){
        repo?.getPetByCategory(id: id, completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let pets = response?.data ?? []
                self.delegate?.getPets(pets: pets)
                return
            }
        })
    }
    
    
    
    
}
