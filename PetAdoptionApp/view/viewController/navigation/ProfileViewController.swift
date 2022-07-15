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
    
    var local = LocalDataRepository(localData: LocalDataSource())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupLister()
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
    
    
    func setupLister(){
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.exitAccount(_:)))
        cardExit.addGestureRecognizer(gesture)
    }
    
    @objc private func exitAccount(_ sender:UITapGestureRecognizer){
        print("Exit")
        logOut()
    }
    
    func loadInfoUser(){
        if let user = local.getUser() {
            userNameLabel.text = user.fullName
            userDetailLabel.text = user.email
            userLogo.loadImage(url: user.image)
        }
    }
    
    func logOut(){
        local.clearLocalData(key: "key_user_profile")
        goToLoginV2()

    }
    
    
    func goToLoginV2(){
        let story = UIStoryboard(name: App.StoryBoardID.login, bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: App.StoryBoardID.loginNavigationViewController) as! LoginNavigationController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    

}
