//
//  UIButtonExtension.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import Foundation
import UIKit


extension UIButton{
    func primaryRoundButton(){
        self.mainRoundButton(color: UIColor.orange)
    }
    
    func cancelButton(){
        self.mainRoundButton(color: UIColor.gray)
    }
    
    func startButton(){
        self.mainRoundButton(color: UIColor.white)
    }
    
    func mainRoundButton(color: UIColor){
        layer.cornerRadius = bounds.height/2
        tintColor = color
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
    
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
             self.clipsToBounds = true  // add this to maintain corner radius
             UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
             if let context = UIGraphicsGetCurrentContext() {
                 context.setFillColor(color.cgColor)
                 context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
                 let colorImage = UIGraphicsGetImageFromCurrentImageContext()
                 UIGraphicsEndImageContext()
                 self.setBackgroundImage(colorImage, for: forState)
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


extension String {
    func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        let dateString:String = self
        let date: Date? = dateFormatterGet.date(from: dateString)
        print("Date",dateFormatterPrint.string(from: date!))
        return dateFormatterPrint.string(from: date!);
    }
    
    func getService() -> String {
        return ApiUtils.PROD_BASE_URL + self
    }
    
    func formatDescriptionTitle() -> String {
        return "Conoce a \(self)"
    }
}




