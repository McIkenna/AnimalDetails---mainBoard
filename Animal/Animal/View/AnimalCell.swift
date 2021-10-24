//
//  AnimalCell.swift
//  Animal
//
//  Created by New Account on 10/23/21.
//

import UIKit

class AnimalCell: UITableViewCell {

   
    @IBOutlet weak var animalImage : UIImageView!
    @IBOutlet weak var animalName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
