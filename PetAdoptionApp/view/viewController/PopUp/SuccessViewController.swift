//
//  SuccessViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import UIKit
import Lottie

protocol PopUpSuccessProtocol {
    func successAcceptAction(action: Bool)
}


class SuccessViewController: UIViewController {

    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var cardIcon: UIView!
    @IBOutlet weak var cardBackground: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupDescription: UILabel!
    
    var messageTitle:String!
    var messageDescription:String!
    var delegate:PopUpSuccessProtocol?
    
    
    
    let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupIcon()
        setupView()

    }
    
    func setupView(){
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        cardBackground.layer.cornerRadius = 6.0
        cardBackground.layer.borderWidth = 1.2
        cardBackground.layer.borderColor = AppUtils.GRAY.cgColor
    
        acceptButton.roundButton()
        
        popupTitle.text =  messageTitle
        popupDescription.text = messageDescription
        
        popupTitle.titleColor()
        popupDescription.detailColor()
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
        self.delegate?.successAcceptAction(action: true)
    }
    

    


}
