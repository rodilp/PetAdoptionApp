//
//  LoadingPopUpViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 25/06/22.
//

import UIKit

class LoadingPopUpViewController: UIViewController {


    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var cardBody: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        //customizing the dialog box view
        cardBody.layer.cornerRadius = 6.0
        cardBody.layer.borderWidth = 1.2
        cardBody.layer.borderColor = AppUtils.GRAY.cgColor
    }
    

   func showPopup(parentVc: UIViewController, msm: String){
        if let popupVc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "LoadingPopUpViewController") as? LoadingPopUpViewController {
            
            //popupVc.message.text = msm
            
            popupVc.modalPresentationStyle = .custom
            popupVc.modalTransitionStyle = .crossDissolve

            
            //setting the delegate of the dialog box to the parent viewController

            //presenting the pop up viewController from the parent viewController
            parentVc.present(popupVc, animated: true)
            
            //self.message.text = msm ?? "gaa"
            
            
        }
        
    }

}
