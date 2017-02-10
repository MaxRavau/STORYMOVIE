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
    
    var currentMovie: Movie?
    
    var movie = [PFObject]()
    
    // On a crée la variable favoriteButton
    var favoriteButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        let movieObject: PFObject = movie[indexPath.row]
        
        cell.labelTitre.text = movieObject["title"] as! String?
        cell.labelAnnee.text = movieObject["annee"] as! String?
        cell.labelMinute.text = movieObject["minutes"] as! String?
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

        
        let MovieInPlaylist = thisMovieIsInPlaylist(film: currentMovie!)
        if MovieInPlaylist == false{
            cell.favoriteButton?.isHidden = false //cela permet a remettre le bouton quand le film n'est plus dans la liste
            cell.favoriteButton?.setImage(#imageLiteral(resourceName: "Add to Favorites-100-2"), for: UIControlState.normal)
            print("le film n'est pas dans la liste")
            
        }else{
            
            
            self.favoriteButton?.isHidden = true //c'est pour faire effacer le bouton quand le film est dans la liste
            self.favoriteButton?.setImage(#imageLiteral(resourceName: "Cancel Filled2"), for: UIControlState.normal)
            print("le film est maintenant dans myPaylist")
            
        }
        
        
        //On utilise cette petite fonction pour sortir le favoriteButton du tableaViewCell et pour l'utiliser dans toute la page
        
        
    }
        return cell
}
    
    
    func getCategorieListe(){
        
        var query = PFQuery(className:"Movie")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.movie = objects!
                self.tableView.reloadData()
                if let movie = objects {
                    for movie in movie {
                        let title = movie["title"]
                        let sousTitle = movie["sousTitle"]
                        let annee = movie["annee"]
                        let minutes = movie["minutes"]
                        
                        print("\(title) \(sousTitle) \(annee) \(minutes)")
                        
                    }
                }
            }
            
        }
    }
        
    

    
    @IBAction func ShareMovie(_ sender: UIButton) {
        
        // image to share
        let image: UIImage = (currentMovie?._image)!
        
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
        
        // on a crée une variable avec la fonction crée dans constante pour déclarer le film
        let MovieInPlaylist = thisMovieIsInPlaylist(film: currentMovie!)
        // on intègre une condition si la variable == true alors
        if MovieInPlaylist == true{
            
            RemoveMoviePlaylist(identifiant: (currentMovie?._identifiant)!)
            self.favoriteButton?.isHidden = false
            self.favoriteButton?.setImage(#imageLiteral(resourceName: "Add to Favorites-100-2"), for: UIControlState.normal)
            
        }else{
            // la ligne 117 permet d'ajouter le film donc currentMovie a la liste myPlaylist
            myPlaylist.append(currentMovie!)
            
            self.favoriteButton?.isHidden = true
            self.favoriteButton?.setImage(#imageLiteral(resourceName: "Cancel Filled2"), for: UIControlState.normal)
            
            return
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
    
    

