//
//  Categorie.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class Categorie {

    // On a crée une class de Catégorie de Film.
    
    var _titre : String = ""
    var _sousTitre : String = ""
    var _imageCover : UIImage = #imageLiteral(resourceName: "Boxe")
    var _listeMovie : [Movie] = []
    
    
    init(titre : String, sousTitre: String, imageCover: UIImage, listeMovie: [Movie]) {
        
        self._titre = titre
        self._sousTitre = sousTitre
        self._imageCover = imageCover
        self._listeMovie = listeMovie
        
        
        
        
    }

}
