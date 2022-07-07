//
//  PetProfileViewController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import UIKit

class PetProfileViewController: UIViewController, PopUpProtocol {

    
    
    var page:Int!
    var idPet:Int = -1

    @IBOutlet weak var petBannerCollectionView: UICollectionView!
    @IBOutlet weak var backCard: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var cardInfo: UIView!
    
    @IBOutlet weak var ownerLogo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLogo: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerDateLabel: UILabel!
    
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var adoptionBt: UIButton!
    
    
    
    var petImages:[Image] = []
    
    // MARK: - Injection
    let viewModel = PetProfileViewModel(petrepository: PetDataSource(), adoptionRepository: AdoptionDataSource())
    var loader : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        print("idpet \(idPet)")
        
        if(idPet != -1){
            viewModel.getPetById(id: idPet)
        }
        
        setupObserver()
        viewModel.delegate = self
        petBannerCollectionView.dataSource = self
        pageControl.currentPage = 0
        
        
        //let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        //imageLogo.addGestureRecognizer(tapGR)
        //imageLogo.isUserInteractionEnabled = true
    
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }
    
    func setupView(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        cardInfo.cardBorder(corner: 15, round: false)
        cardInfo.dropShadow(color: AppUtils.SECONDARY_GRAY, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 15, scale: true)
        backCard.roundView()
        ownerLogo.roundBorder(corner: 0, round: true)
        
        nameLabel.titleColor()
        raceLabel.detailColor()
        addressLabel.detailColor()
        ageLabel.detailColor()
        
        ownerNameLabel.titleColor()
        ownerLabel.detailColor()
        ownerDateLabel.detailColor()
        
        descriptionTitleLabel.titleColor()
        descriptionLabel.detailColor()
        
        adoptionBt.roundButton()
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func adoptionButton(_ sender: UIButton) {
        adoptionBt.bounce()
        
        self.showAlertPopUp(title: "¡Confirmación!", description: "Estas seguro de enviar su solicitud de adopcion?", showCancel: true)
    }
    
    
    func setupObserver(){
        viewModel.didFinishAdoptionRequest  = { response in
            self.loader?.dismiss(animated: true, completion: {
                self.showSuccessPopUp(title: "¡Felicitaciones!", description: response.message)
            })
        }
    }
    
    func loadInfoPet(pet: Pet){
        nameLabel.text = pet.name
        raceLabel.text = pet.race
        addressLabel.text = pet.address
        ageLabel.text = "\(pet.age), \(pet.ageTime)"
        
        if let owner = pet.owner {
            ownerLogo.loadImage(url: owner.image)
            ownerNameLabel.text = owner.fullName
            ownerDateLabel.text = owner.createdAt.formatDate()
            ownerLabel.text = AppUtils.OWNER
        }
        
        descriptionTitleLabel.text = pet.name.formatDescriptionTitle()
        descriptionLabel.text = pet.description
        
        var image = UIImage()
        if(pet.sex == AppUtils.MALE){
            image = UIImage(named: "icon_male")!
        }else{
            image = UIImage(named: "icon_female")!
        }
        let imageView = UIImageView(image: image)
        sexLogo.image = imageView.image
    }
    
    
    func accepAction(action: Bool) {
        let idUser = LocalUserRepository().getUser()?.idUser
        let requestAdoption = AdoptionRequest(idUser!, idPet)
        
        self.loader = self.showLoader(msm: "Solicitando...")
        viewModel.requestAdoption(request: requestAdoption)
    }
    
}

extension PetProfileViewController: PetDelegate{
    func getPet(pet: Pet) {
        self.petImages = pet.images
        petBannerCollectionView.reloadData()
        pageControl.numberOfPages = petImages.count
        self.loadInfoPet(pet: pet)
    }
    
    
}

extension PetProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = petBannerCollectionView.dequeueReusableCell(withReuseIdentifier: "PetBannerCollectionViewCell", for: indexPath) as! PetBannerCollectionViewCell
        let image = petImages[indexPath.row]
        cell.petImage.loadImage(url: image.url)
        
        return cell
    }
 
}

extension PetProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
