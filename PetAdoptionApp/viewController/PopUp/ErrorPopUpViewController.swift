//
//  ErrorPopUpViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 25/06/22.
//

import UIKit


protocol PopUpProtocol {
    func accepAction(action: Bool)
}

class ErrorPopUpViewController: UIViewController {
    
    @IBOutlet weak var cardBox: UIView!
    @IBOutlet weak var accepButton: UIButton!
    var delegate: PopUpProtocol?

    private let color = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        //customizing the dialog box view
        cardBox.layer.cornerRadius = 6.0
        cardBox.layer.borderWidth = 1.2
        cardBox.layer.borderColor = color.cgColor
        
        //accepButton.roundButton()
        accepButton.setTitleColor(UIColor.black, for: .normal)
        accepButton.layer.cornerRadius = 4.0
        accepButton.layer.borderWidth = 1.2
        accepButton.layer.borderColor = UIColor.orange.cgColor
    }
    
    
    @IBAction func accept(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.accepAction(action: true)
    }
    
    static func showPopup(parentVc: UIViewController){
        if let popupVc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "ErrorPopUpViewController") as? ErrorPopUpViewController {
            
            popupVc.modalPresentationStyle = .custom
            popupVc.modalTransitionStyle = .crossDissolve
            
            //setting the delegate of the dialog box to the parent viewController
            popupVc.delegate = parentVc as? PopUpProtocol

            //presenting the pop up viewController from the parent viewController
            parentVc.present(popupVc, animated: true)
            
        }
        
    }

}
