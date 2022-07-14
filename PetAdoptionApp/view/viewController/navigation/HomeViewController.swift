//
//  PrimerViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 24/06/22.
//

import UIKit

class HomeViewController: UIViewController  {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var petCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    var categories:[Category] = []
    var pets:[Pet] = []
    var filterPets:[Pet] = []
    
    // MARK: - Injection
    let viewModel = HomeViewModel(repo: PetRepository())
    var local = LocalDataRepository(localData: LocalDataSource())
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        viewModel.delegate = self
        
        viewModel.getListCategory()
        viewModel.getPets()
        
        categoryCollectionView.dataSource = self
        petCollectionView.dataSource = self


    }
    
    //life of cicle view
    override func viewDidAppear(_ animated: Bool) {
        //call Api
    }

    
    func setupView(){
        searchTextField.searchTextField()
        imageLogo.roundBorder(corner: 0, round: true)
        
        if let image = local.getUser(){
            imageLogo.loadImage(url: image.image)
        }
        
        titleLabel.titleColor()
        sectionTitleLabel.titleColor()
        
        searchTextField.addTarget(self, action: #selector(searchPet(textField:)), for: .editingChanged)
    }
    
    
    @objc private func searchPet(textField: UITextField) {
       if let textField = searchTextField {
           filterPets = []
           if(textField.text == ""){
                filterPets = pets
            }
            pets.forEach { pet in
                let letter = pet.name + pet.race
                if(letter.lowercased().contains(textField.text?.lowercased() ?? "")){
                    filterPets.append(pet)
                }
            }
        self.petCollectionView.reloadData()
       }
        
    }
    

    
    
    func goToPetProfile(idPet:Int){
        let controller : PetProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "PetProfileViewController") as! PetProfileViewController
        controller.idPet = idPet
            self.navigationController?.pushViewController(controller, animated: true)
    }
    

    
    



}

extension HomeViewController: CategoryDelegate{
    func getPets(pets: [Pet]) {
        self.pets = pets
        self.filterPets = pets
        petCollectionView.reloadData()
    }
    
    func getCategories(cat: [Category]) {
        self.categories = cat
        categoryCollectionView.reloadData()
    }
}




extension HomeViewController: UICollectionViewDataSource{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if(collectionView == petCollectionView){
           return filterPets.count
        }
        
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        if(!categories.isEmpty){
            if(collectionView == categoryCollectionView){
                let cat = categories[indexPath.row]

                if(cat.name == "Todos"){
                    cell.contentView.backgroundColor = AppUtils.PRIMARY_ORANGE
                    cell.contentView.layer.cornerRadius = 15
                    cell.categoryLabel.textColor = .white
                    cell.categoryLabel.text = ""
                }else{
                    cell.categoryLabel.text = cat.name
                }
                
                cell.catogoryLogo.loadImage(url: cat.icon)
                cell.round()
                cell.categoryLabel.titleColor()
            
            }
        }
            

       
        
        if(collectionView == petCollectionView){
            let cell2 = petCollectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionViewCell", for: indexPath) as! PetCollectionViewCell
            
            if(!pets.isEmpty){
                let pet = filterPets[indexPath.row]
                cell2.nameLabel.text = pet.name
                cell2.detailLabel.text = "\(pet.sex), \(pet.age) \(pet.ageTime)"
                cell2.petImage.roundBorder(corner: 15, round: false)
                
                cell2.nameLabel.titleColor()
                cell2.detailLabel.detailColor()
                if(!pet.images.isEmpty){
                    cell2.petImage.loadImage(url: pet.images[0].url)
                }
            }
            return cell2
        }
        return cell
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == petCollectionView){
            print("Cell Pets \(indexPath.row + 1) clicked")
            let pet = filterPets[indexPath.row]
            goToPetProfile(idPet: pet.idPet)
        }
        
        if(collectionView == categoryCollectionView){
            if let cell = categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell{
                cell.selectedBackground()
                cell.categoryLabel.textColor = .white
                
                let model = categories[indexPath.row]
                viewModel.getPetsByCategory(id: model.idCategory)
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if(collectionView == categoryCollectionView){
            if let cell = categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell{
                cell.round()
                cell.categoryLabel.titleColor()
            }
            let category = categories[indexPath.row]
            print("Cell deselect -> \(category.name) clicked")
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if(collectionView == categoryCollectionView){
            if let cell = categoryCollectionView.cellForItem(at: indexPath){
                cell.round()
            }
            
            if(!categories.isEmpty){
                if let cell2 = categoryCollectionView.cellForItem(at: [0,0])  as? CategoryCollectionViewCell{
                    cell2.contentView.backgroundColor = nil
                    cell2.categoryLabel.titleColor()
                }
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if(collectionView == categoryCollectionView){
            if let cell = categoryCollectionView.cellForItem(at: indexPath){
                cell.contentView.backgroundColor = nil
            }
        }
    }
    
    
}


