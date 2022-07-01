//
//  UIButtonExtension.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import Foundation
import UIKit


extension UIButton{
    func roundButton(){
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
    
    func roundTextField(){
        layer.cornerRadius = bounds.height/2
        layer.borderColor = AppUtils.GRAY.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
    
    func searchTextField(){
        layer.cornerRadius = 8
        
        let image = UIImage(named: "search_icon")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: frame.height))
     
        imageView.image = image
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 45 + 2 * 0, height: frame.height))
     
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
        
        layer.borderColor = AppUtils.GRAY.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
}


extension UIImageView{
    func roundBorder(corner:CGFloat, round:Bool){
        if(round){
            layer.cornerRadius = frame.height/2
        }else{
            layer.cornerRadius = corner
        }
        layer.borderColor = AppUtils.GRAY.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    func loadImage(url:String){
        let fileUrl = URL(string: url)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: fileUrl){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            
        }
    }

}

extension UILabel {
    func titleColor(){
        textColor = AppUtils.TITLE_COLOR
    }
    func detailColor(){
        textColor = AppUtils.TEXT_COLOR
    }
}

