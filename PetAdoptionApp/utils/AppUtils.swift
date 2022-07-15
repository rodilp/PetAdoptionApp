//
//  AppUtils.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import Foundation
import UIKit

struct AppUtils{
    
    static let GRAY = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
    static let PRIMARY_ORANGE = UIColor(red: 255/255, green: 167/255, blue: 31/255, alpha: 1)
   // static let PRIMARY_ORANGE = UIColor(red: 253/255, green: 206/255, blue: 82/255, alpha: 1)
    static let PRIMARY_LIGTH = UIColor(red: 1/255, green: 81/255, blue: 120/255, alpha: 1)
    static let SECONDARY_GRAY = UIColor(red: 127/255, green: 146/255, blue: 164/255, alpha: 0.5)
    static let TITLE_COLOR = UIColor(red: 9/255, green: 44/255, blue: 76/255, alpha: 1)
    static let TEXT_COLOR = UIColor(red: 127/255, green: 146/255, blue: 164/255, alpha: 1)
    
    static let MALE = "Macho"
    static let OWNER = "Dueño"
    static let OWNER_ID = 2
}


enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
