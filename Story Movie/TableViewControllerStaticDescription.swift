//
//  TableViewControllerStaticDescription.swift
//  Story Movie
//
//  Created by Maxime Ravau on 23/03/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class TableViewControllerStaticDescription: UITableViewController {

    
    var currentMovie: PFObject?
    
    var listeFavorite: [PFObject?] = []
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelSousTitle: UITextView!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var labelMinute: UILabel!
    @IBOutlet var labelAnnee: UILabel!
    @IBOutlet var buttonFavorite: UIButton!
    @IBOutlet var myTableViewDescription: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        
        
        
    }
    
    
    func initUI(){
        
        getTitle()
        getAnnee()
        getSousTitle()
        getMinute()
        getImageCover()
        getMovieDescription()
        configurationButton()
        buttonFavoriteHidden()
        
    }
    
    func configurationButton(){
    
        buttonFavorite.layer.borderWidth = 0.5
        buttonFavorite.layer.borderColor = UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        buttonFavorite.layer.cornerRadius = 15

    
    
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

    func getTitle(){
        
        let movieTitle = currentMovie?["title"]
        
        labelTitle.text = movieTitle as! String?
        
        }
    
    func getSousTitle(){
        
        let movieSousTitle = currentMovie?["sousTitle"]
        
        labelSousTitle.text = movieSousTitle as! String?
        
        
    }
    
    func getAnnee(){
        
        
        let movieAnnee = currentMovie?["annee"]
        
        labelAnnee.text = movieAnnee as! String?
        
    }
    
    func getMinute(){
        
        
        let movieMinutes = currentMovie?["duree"]
        
        labelMinute.text = movieMinutes as! String?
        
    }
    
    func getImageCover(){
        
        let movieObject: PFObject = currentMovie!
        
        if let userPicture = movieObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    self.imageCover.image = UIImage(data: imageData!)
                    
                }
            })
            
        }

        
        
    }
    
    func buttonFavoriteHidden(){
        
        let MovieInFavoris = checkListFavorite(movie: currentMovie!)
        
        if MovieInFavoris == true {
            
            
            buttonFavorite.isHidden = true
            
        }else{
            
            buttonFavorite.isHidden = false
            
        }
        
        
    }
    
    func getMovieDescription(){
        
        let query = PFQuery(className:"Movies")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.whereKey("favoriteMovieIdList", equalTo: "identifiant")
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
    
    @IBAction func ButtonTapAddToFavorite(_ sender: Any) {
    
        SaveMovieUser()
        
        navigationController?.popToRootViewController(animated: true)
    
    }
    
    
    func SaveMovieUser() {
        
        let currentUser = PFUser.current()
        currentUser?.addUniqueObject(self.currentMovie!.objectId!, forKey: "favoriteMovieIdList")
        currentUser?.saveInBackground(block: { (success, error) -> Void in
            if error != nil {
                print("error")
            } else {
                print("le \(self.currentMovie) est bien dans la liste des favoris")
            }
        })
    }



}

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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


