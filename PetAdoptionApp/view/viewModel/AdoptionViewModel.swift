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
    
    var didFinishAdoptionApprove:((_ res:BaseResponse) -> Void)?
    var response: BaseResponse? {
        didSet {
            self.didFinishAdoptionApprove?(response!)
        }
    }
    
    func getAdoptions(id:Int){
        adoptionRepository?.adoptionStatus(id: id, completion: { response, error in
            if(response?.code == HttpUtil.OK){
                let listAdoption = response?.data ?? []
                self.delegate?.getAdoptions(adoptions: listAdoption)
            }
        })
    
    }
    
    func approveAdoption(request: ApproveAdoptionRequest){
        adoptionRepository?.approveAdoption(request: request, completion: { response, error in
            if(response?.code == HttpUtil.OK){
                self.response = response
                return
            }
        })
        
    }
    
    func requestAdoption(request:AdoptionRequest){
        adoptionRepository?.requestAdoption(request: request, completion: { response, error in
            if(response?.code == HttpUtil.OK){
                self.response = response
                return
            }
            
        })
    }
        
    
}
