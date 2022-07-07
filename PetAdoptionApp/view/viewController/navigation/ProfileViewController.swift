//
//  ProfileViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userLogo: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDetailLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var cardExit: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        loadInfoUser()
    }
    
    func setupView(){
        userLogo.roundBorder(corner: 0, round: true)
        userNameLabel.titleColor()
        userDetailLabel.detailColor()
        cardExit.cardBorder(corner: 15, round: false)
        cardExit.dropShadow(color: AppUtils.SECONDARY_GRAY, opacity: 0.3, offSet: CGSize(width: -1, height: 1), radius: 15, scale: true)
        offLabel.titleColor()
        titleLabel.titleColor()
        
    }
    
    func loadInfoUser(){
        if let user = LocalUserRepository().getUser() {
            userNameLabel.text = user.fullName
            userDetailLabel.text = user.email
            userLogo.loadImage(url: user.image)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
