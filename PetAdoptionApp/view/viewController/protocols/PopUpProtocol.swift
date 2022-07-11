//
//  PopUpProtocol.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 11/07/22.
//

import Foundation

protocol PopUpProtocol{
    func onAcceptAction()
    func onCancelAction()
}

protocol PopUpSuccessProtocol{
    func onSuccessAcceptAction()
}
