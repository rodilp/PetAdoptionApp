//
//  PrimerViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var imageLogo: UIImageView!
    
    var categories = ["Todos", "Perros", "Gatos", "Conejos", "Loros"]
    
    //interface
    var repository : PetRepository?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        repository = PetRemoteRepository()
        loadPet()
        // Do any additional setup after loading the view.
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageLogo.addGestureRecognizer(tapGR)
        imageLogo.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }
    
    func loadPet(){
        let pets = repository?.getPets()
        print(pets?.data ?? "")
    }
    
    
    func setupView(){
        searchTextField.searchTextField()
        imageLogo.roundBorder()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryLabel.text = categories[indexPath.row]
        cell.round()
        
        return cell
    }



}
