





//Créer une liste de string prenomListe qui contient  [« roger » , « max » , « clément, « Dimitri » , « Valentin »  ]

//Créer une fonction isNameExistOnPrenomListe qui prends en paramètre une string et qui renvoie un bool.


//Le but de cette fonction c est de dire si un prénom envoyé en paramètre existe dans la liste.

//Si par exemple je fais isNameExistOnPrenomListe(« roger ») ça me renvoie true
//Si je fait isNameExistOnPrenomListe(« mathieu ») ça me renvoie false



var prenomListe = ["roger", "max", "clement", "Dimitri", "Valentin"]


func isNameExistOnPrenomListe(names: String) -> Bool{
    

    for name in prenomListe {
        
        if name == names {
            
            
            return true
        }else{
            
            
            
        }
        
        
    }
    
    
    return false
    
}


isNameExistOnPrenomListe(names: "max")

/*
if let userPicture = movieObject["image"] as? PFFile {
    print("get user picture")
    userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
        print("get user picture response")
        if (error == nil) {
            print("get user picture no error")
            cell.imageCover.image = UIImage(data: imageData!)
            
        }
    })
    
}

let MovieInPlaylist = checkListFavorite(movie: currentMovie!)

if MovieInPlaylist == false{
    cell.favoriteButton?.isHidden = false //cela permet a remettre le bouton quand le film n'est plus dans la liste
    //cell.favoriteButton?.setImage(#imageLiteral(resourceName: "Add to Favorites-100-2"), for: UIControlState.normal)
    print("le film n'est pas dans la liste")
    
}else{
    
    
    cell.favoriteButton?.isHidden = true //c'est pour faire effacer le bouton quand le film est dans la liste
    //self.favoriteButton?.setImage(#imageLiteral(resourceName: "Cancel Filled2"), for: UIControlState.normal)
    print("le film est maintenant dans myPaylist")
    
    
    
    
    //On utilise cette petite fonction pour sortir le favoriteButton du tableaViewCell et pour l'utiliser dans toute la page
    
}



*/
