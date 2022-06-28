//
//  SuccessViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import UIKit
import Lottie

class SuccessViewController: UIViewController {

    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var cardIcon: UIView!
    @IBOutlet weak var cardBackground: UIView!

    
    let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupIcon()
        // Do any additional setup after loading the view.
        
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        //customizing the dialog box view
        cardBackground.layer.cornerRadius = 6.0
        cardBackground.layer.borderWidth = 1.2
        cardBackground.layer.borderColor = AppUtils.GRAY.cgColor
    
        acceptButton.roundButton()

    }
    
    
    func setupIcon(){
        animationView.animation = Animation.named("successful")
        animationView.frame = cardIcon.bounds
        animationView.backgroundColor = UIColor.white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        cardIcon.addSubview(animationView)

    }
    
    
    
    @IBAction func accept(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func showPopup(parentVc: UIViewController){
        if let popupVc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController {
            
            popupVc.modalPresentationStyle = .custom
            popupVc.modalTransitionStyle = .crossDissolve
            
            //setting the delegate of the dialog box to the parent viewController
            //popupVc.delegate = parentVc as? PopUpProtocol

            //presenting the pop up viewController from the parent viewController
            parentVc.present(popupVc, animated: true)
            
        }
        
    }
    


}
