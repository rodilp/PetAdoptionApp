//
//  Setting.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 8/07/22.
//

import Foundation

struct Setting:Codable {
    var isLauchApp:Bool = false
    
    init(isLaunchApp:Bool){
        self.isLauchApp = isLaunchApp
    }

}
