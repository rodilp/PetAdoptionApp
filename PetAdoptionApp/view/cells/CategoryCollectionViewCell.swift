//
//  CategoryCollectionViewCell.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 28/06/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var catogoryLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let unsBack = UIView(frame: bounds)
        unsBack.round()
        self.backgroundView = unsBack
        
        let selBack = UIView(frame: bounds)
        selBack.selectedBackground()
        self.selectedBackgroundView = selBack

        
        
    }
    
}
