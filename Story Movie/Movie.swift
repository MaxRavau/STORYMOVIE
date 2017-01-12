//
//  Movie.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class Movie {

    var _titre: String = ""
    var _sousTitre: String = ""
    var _image : UIImage = #imageLiteral(resourceName: "Boxe")
    var _duree : String = ""
    var _annee : String = ""
    var _identifiant : Int = 0
    
    init(titre: String, sousTitre: String, image: UIImage, duree : String, annee: String, identifiant: Int) {
        
        self._titre = titre
        self._sousTitre = sousTitre
        self._image = image
        self._duree = duree
        self._annee = annee
        self._identifiant = identifiant
    }

}
