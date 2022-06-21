//
//  UIButtonExtension.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import Foundation
import UIKit

private let color = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)

extension UIButton{
    func round(){
        layer.cornerRadius = bounds.height/2
        tintColor = UIColor.orange
        clipsToBounds = true
    }
    
    //Rebote
    func bounce(){
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { Bool in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }
    }
    
    //Brillar
    func shine(){
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.5
        } completion: { Bool in
            UIView.animate(withDuration: 0.1) {
                self.alpha = 1
            }
        }
    }
    
    
    //Saltar
    func jump(){
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        } completion: { Bool in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }
    }
}


extension UITextField {
    
    func round(){
        layer.cornerRadius = bounds.height/2
        layer.borderColor = color.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
}
