//
//  TableViewCellDF.swift
//  Story Movie
//
//  Created by Maxime Ravau on 03/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellDF: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var LabelTitre: UILabel!
    @IBOutlet var LabelAnnee: UILabel!
    @IBOutlet var Labelminutes: UILabel!
    @IBOutlet var ImageCover: UIImageView!
    @IBOutlet var LabelSousTitre: UITextView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
