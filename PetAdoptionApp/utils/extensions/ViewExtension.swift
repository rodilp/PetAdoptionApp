//
//  ViewExtension.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 21/06/22.
//

import UIKit

extension UIView {

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
            clipsToBounds = true
        }
    
    
    func roundView(){
        layer.cornerRadius = bounds.height/2
        clipsToBounds = true
    }
    
    func round(){
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderColor = AppUtils.GRAY.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
    
    func selectedBackground(){
        backgroundColor = AppUtils.PRIMARY_ORANGE
        layer.cornerRadius = 15
        layer.borderColor = AppUtils.PRIMARY_ORANGE.cgColor
        layer.backgroundColor = AppUtils.PRIMARY_ORANGE.cgColor
        tintColor = AppUtils.PRIMARY_ORANGE
        layer.borderWidth = 1.0
        clipsToBounds = true
        
    }
    
    
    func cardBorder(corner:CGFloat, round:Bool){
        if(round){
            layer.cornerRadius = frame.height/2
        }else{
            layer.cornerRadius = corner
        }
        backgroundColor = .white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
       layer.masksToBounds = false
       layer.shadowColor = color.cgColor
       layer.shadowOpacity = opacity
       layer.shadowOffset = offSet
       layer.shadowRadius = radius

       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       layer.shouldRasterize = true
       layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
}



extension UIViewController {
    func showLoader(msm:String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: msm, preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        alert.view.addSubview(indicator)
        self.present(alert, animated: true, completion: nil)
        return alert
    }
    
    func stopLoading(loader: UIAlertController) {
        loader.dismiss(animated: true, completion: nil)
        
    }
    
    func showAlert(msm:String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: msm, preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.style = .large
        alert.view.addSubview(indicator)
        self.present(alert, animated: true, completion: nil)
        return alert
    }
    
    
    func presentAlert(withTitle title: String, message : String) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "Aceptar", style: .default) { action in
          print("Pressed OK...")
      }
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
    
    
    func showAlertPopUp(title:String, description:String, showCancel:Bool){
        if let popupVc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "ErrorPopUpViewController") as? AlertPopUpViewController {
            popupVc.messageTitle = title
            popupVc.messageDescription = description
            popupVc.isShowCancel = showCancel
            
            popupVc.modalPresentationStyle = .custom
            popupVc.modalTransitionStyle = .crossDissolve
            
            popupVc.delegate = self as? PopUpProtocol
            present(popupVc, animated: true)
            
        }
    }
    
    
    func showSuccessPopUp(title:String, description:String){
        if let popupVc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController {
            
            popupVc.messageTitle = title
            popupVc.messageDescription = description
            
            popupVc.modalPresentationStyle = .custom
            popupVc.modalTransitionStyle = .crossDissolve
            
            popupVc.delegate = self as? PopUpSuccessProtocol

            present(popupVc, animated: true)
            
        }
    }
    
    
    func getIconBySex(sex:String) -> UIImage {
        var image = UIImage()
        if(sex == AppUtils.MALE){
            image = UIImage(named: "icon_male")!
        }else{
            image = UIImage(named: "icon_female")!
        }
        let imageView = UIImageView(image: image)
        return imageView.image!
    }
    
    func getIconByUser(typeUser:Int) -> UIImage {
        var image = UIImage()
        if(typeUser == AppUtils.OWNER_ID){
            image = UIImage(named: "icon_approve_request")!
        }else{
            image = UIImage(named: "icon_send_request")!
        }
        let imageView = UIImageView(image: image)
        return imageView.image!
    }
    

    
    
    
    
    
    
}






