//
//  AdoptionTableViewCell.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import UIKit


protocol CellProtocol {
    func accepAction(action: Bool)
}

class AdoptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petSexLogo: UIImageView!
    @IBOutlet weak var petRaceLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDetailLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    var delegate: CellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    @IBAction func acceptButton(_ sender: UIButton) {
        print("Selected...\(petNameLabel.text ?? "NUll")")
        self.delegate?.accepAction(action: true)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        statusButton.bounce()
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
