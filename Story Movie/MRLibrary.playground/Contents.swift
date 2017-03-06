
// var selectedCategorie: PFObject?

//var query = PFQuery(className:"Movies")
// On crée une variable query de type PFQuery qui va récuperer une liste de PFObject de la classe "GameScore"

//query.whereKey("categorie_movie", equalTo: selectedCategorie.ObjectID)
// Quand on ajoute query.whereKey cela sert a filtrer un résultat 
// Je veux que ma query me renvoit les movies qui ont pour categorie_movie qui s'appelle ""
//query.findObjectsInBackgroundWithBlock {
// J'éxécute la requête pour récupéré mes données pour le projet
    //(objects: [PFObject]?, error: NSError?) -> Void in
    // la réponse de la requête me renvoie un objects et une error
    //if error == nil {

//si error est nul alors c'est un success
        // The find succeeded.
       // print("Successfully retrieved \(objects!.count) scores.")
        // Do something with the found objects
       // if let objects = objects {
//Si objects = objects
         //   for object in objects {
//On fait une boucle object in Objects
            //    print(object.objectId)
//On print object.objectID
         //   }
     //   }
 //   } else {
//Sinon Il ya une error
        // Log details of the failure
     //   print("Error: \(error!) \(error!.userInfo)")
//On print l'info de l'error
 //   }
//}


