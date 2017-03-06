//
//  TableViewControllerDescription.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse


class TableViewControllerDescription: UITableViewController {
    
    var movie: Movie?
    
    var currentMovie: PFObject?
    
    var listeFavorite: [PFObject?] = []
    
    var favoriteButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    }
    
    func initUI(){
        
        getMovieDescription()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
        //chaque fois que arrives sur cette page tu mets à jour le contenu de la page
        
        super.viewWillAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype4", for: indexPath) as! TableViewCellDescription
        
        let movieObject: PFObject = currentMovie!
        
        cell.labelTitre.text = movieObject["title"] as! String?
        cell.labelAnnee.text = movieObject["annee"] as! String?
        cell.labelMinute.text = movieObject["duree"] as! String?
        cell.labelSousTitre.text = movieObject["sousTitle"] as! String?
        self.favoriteButton = cell.favoriteButton
        
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
        
        //let MovieInPlaylist = thisMovieIsInPlaylist(film: currentMovie!)
        //if MovieInPlaylist == false{
        // cell.favoriteButton?.isHidden = false //cela permet a remettre le bouton quand le film n'est plus dans la liste
        //cell.favoriteButton?.setImage(#imageLiteral(resourceName: "Add to Favorites-100-2"), for: UIControlState.normal)
        // print("le film n'est pas dans la liste")
        
        // }else{
        
        
        //self.favoriteButton?.isHidden = true //c'est pour faire effacer le bouton quand le film est dans la liste
        //self.favoriteButton?.setImage(#imageLiteral(resourceName: "Cancel Filled2"), for: UIControlState.normal)
        //print("le film est maintenant dans myPaylist")
        
        
        
        
        //On utilise cette petite fonction pour sortir le favoriteButton du tableaViewCell et pour l'utiliser dans toute la page
        
        //}
        
        return cell
    }
    
    
    func getMovieDescription(){
        
        let query = PFQuery(className:"Movies")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.whereKey("liste_favorite", equalTo: "identifiant")
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                //self.currentMovie = objects!
                self.tableView.reloadData()
                if let currentMovie = objects {
                    for movie in currentMovie {
                        let title = movie["title"]
                        let sousTitle = movie["sousTitle"]
                        let annee = movie["annee"]
                        let duree = movie["duree"]
                        
                        print("\(title) \(sousTitle) \(annee) \(duree)")
                        
                    }
                }
            }
            
        }
    }
    
    
    
    
    @IBAction func ShareMovie(_ sender: UIButton) {
        
        // image to share
        let image: UIImage = (movie?._image)!
        
        // set up activity view controller
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func buttonTapFavorite(_ sender: Any)-> Void {
        
        
        SaveMovieUser()
        
    }
    
    
    func SaveMovieUser() {
        
        let currentUser = PFUser.current()
        currentUser?.addUniqueObject(self.currentMovie!.objectId!, forKey: "liste_favorite")
        currentUser?.saveInBackground(block: { (success, error) -> Void in
            if error != nil {
                print("error")
            } else {
                print("le \(self.currentMovie) est bien dans la liste des favoris")
            }
        })
    }
    
    func getListFavorite(){
        //On crée la fonction getListFavorite()
        let query = PFQuery(className:"User")
        // On crée une variable query qui est egal a la classe User
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        
        query.findObjectsInBackground { (objects, error) in
            // dans la variable on recherche les objects et les erreurs
            if error == nil {
                //Si il ya pas d'erreur
                print("Successfully retrieved \(objects!.count) scores.")
                self.tableView.reloadData()
                //Mettre le tableau a jour
                if let listeFavorite = objects {
                    //si la variable listefavorite = a object
                    for favoris in listeFavorite {
                        // pour favoris dans la listeFavorite
                        let listeFavorite = favoris["liste_favorite"]
                        //la variable liste_favorite est égal a favoris["liste_favorite"]
                        print("\(listeFavorite)")
                    }
                }
            }
            
        }
        
        
    }
    
    
    
}







/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



