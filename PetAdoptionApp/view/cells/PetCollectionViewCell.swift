//
//  PetCollectionViewCell.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    static let identifier = "PetCollectionViewCell"

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
}
