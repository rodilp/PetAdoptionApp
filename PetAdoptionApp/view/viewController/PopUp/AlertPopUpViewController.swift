//
//  ErrorPopUpViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 25/06/22.
//

import UIKit



class AlertPopUpViewController: UIViewController {
    
    @IBOutlet weak var cardBox: UIView!
    @IBOutlet weak var accepButton: UIButton!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var popupDescription: UILabel!
    
    var delegate: PopUpProtocol?
    
    var messageTitle:String!
    var messageDescription:String!
    var isShowCancel:Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    func setupView(){
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        //customizing the dialog box view
        cardBox.layer.cornerRadius = 6.0
        cardBox.layer.borderWidth = 1.2
        cardBox.layer.borderColor = AppUtils.GRAY.cgColor
        
        accepButton.roundButton()
        cancelButton.cancelButton()
        
        popupTitle.text = messageTitle
        popupDescription.text = messageDescription
        
        popupTitle.titleColor()
        popupDescription.detailColor()
        
        if(!isShowCancel){
            cancelButton.alpha = 0
        }
    }
    
    @IBAction func accept(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            self.delegate?.onAcceptAction()
        })
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.onCancelAction()
    }
    

}
