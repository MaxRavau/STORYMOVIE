//
//  TableViewCellPolicy.swift
//  Story Movie
//
//  Created by Maxime Ravau on 02/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellPolicy: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var labelTitre: UILabel!
    @IBOutlet var labelSoustitre: UITextView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
