//
//  TableViewControllerDF.swift
//  Story Movie
//
//  Created by Maxime Ravau on 03/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class TableViewControllerDF: UITableViewController {
    
    var currentMovie: PFObject?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype7", for: indexPath) as! TableViewCellDF
        
        let movieObject: PFObject = currentMovie!
        
        cell.LabelTitre.text = movieObject["title"] as! String?
        cell.LabelSousTitre.text = movieObject["sousTitle"] as! String?
        cell.Labelminutes.text = movieObject["duree"] as! String?
        cell.LabelAnnee.text = movieObject["annee"] as! String?
        cell.ImageCover.image = UIImage()
        
        if let userPicture = movieObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.ImageCover.image = UIImage(data: imageData!)
                    
                }
            })
            
        }

        
        return cell
    }
    
    @IBAction func buttonTapSup(_ sender: Any) {
        
        currentMovie?.remove(currentMovie!.objectId!, forKey: "favoriteMovieIdList")
        
        currentMovie?.saveInBackground(block: { (Bool, Error) in
            if Error == nil {
                
               print("le film est \(self.currentMovie) est bien supprimé des favoris")
            }else{
                
                print("error")
           }
        })
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func getMovieDescription(){
        
        let query = PFQuery(className:"Movies")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
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
    
}
