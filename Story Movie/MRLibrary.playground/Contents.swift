





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




