//
//  TableViewCellDescription.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellDescription: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var labelTitre: UILabel!
    @IBOutlet var labelMinute: UILabel!
    @IBOutlet var labelAnnee: UILabel!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var labelSousTitre: UITextView!
    @IBOutlet var favoriteButton: UIButton!
    
    
       
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
