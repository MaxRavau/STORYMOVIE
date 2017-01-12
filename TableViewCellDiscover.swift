//
//  TableViewCellDiscover.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellDiscover: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var labelButton2: UIButton!
    
    @IBOutlet var labelButton1: UIButton!
    
    @IBOutlet var labelTitre: UILabel!

    @IBOutlet var labelSousTitre: UILabel!
    
    @IBOutlet var imageCover: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
