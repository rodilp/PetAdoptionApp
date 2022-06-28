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
    
}

