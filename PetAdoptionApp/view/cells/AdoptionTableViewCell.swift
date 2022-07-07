//
//  AdoptionTableViewCell.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 6/07/22.
//

import UIKit


protocol CellProtocol {
    func acceptCellAction(idAdoption: Int, idUser:Int)
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
    
    var adoption: Adoption?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        
      
        
    }
    
    
    @IBAction func acceptButton(_ sender: UIButton) {
        self.delegate?.acceptCellAction(idAdoption: adoption?.idReq ?? -1, idUser: adoption?.user.idUser ?? -1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
