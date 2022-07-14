//
//  ObservableObject.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 13/07/22.
//

import Foundation

final class ObservableObject<T>{
    
    var value : T {
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T){
        self.value = value
    }
    
    func observe(_ listener: @escaping(T) -> Void){
        listener(value)
        self.listener = listener
        
    }
}
