//
//  PetProfileViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import UIKit

class PetProfileViewController: UIViewController {
    
    var page:Int = 0
    var idPet:Int!

    @IBOutlet weak var petBannerCollectionView: UICollectionView!
    @IBOutlet weak var backCard: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        petBannerCollectionView.dataSource = self
        backCard.roundView()
        print("ID Pet \(String(describing: idPet))")

        // Do any additional setup after loading the view.
    }
    
    //https://www.youtube.com/watch?v=KhebpuFBD14&t=3s&ab_channel=Brain4CodeLearning
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    



}

extension PetProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = petBannerCollectionView.dequeueReusableCell(withReuseIdentifier: "PetBannerCollectionViewCell", for: indexPath) as! PetBannerCollectionViewCell
        
        return cell
    }
    
    
}
