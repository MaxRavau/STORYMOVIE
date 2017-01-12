//
//  TableViewControllerDiscover.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewControllerDiscover: UITableViewController {

    var selectedCategorie: Categorie?
    
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
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        print("\(listeCategorie.count)")
        
        return listeCategorie.count
        
        // On veut que notre tableau fasse la taille de notre liste
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        // On a crée une condition pour dire que si c'est le premier il retourne le prototype1 sinon si ce n'est pas le premier il return cell2
        // Si le tableau est à 0, il me retourne prototype 2, après le tableau est égal a 1 donc on demande a indexPath.row d'aller chercher l'élément 0 de la liste donc on recule de 1 (indexPath.row - 1)
        // On recule de 1 pour commencer au début de la liste, c'est un décalage.
        
        let index: Int = indexPath.row
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype2", for: indexPath) as! TableViewCellDiscover
            
            let categorie: Categorie = listeCategorie[index]
            cell.labelTitre.text = categorie._titre
            cell.labelSousTitre.text = categorie._sousTitre
            cell.imageCover.image = categorie._imageCover
            
            
            return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // On a crée une condition suite a la différence de  taille entre cell et cell2
        
            return 225
            
            
        }
        
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        self.selectedCategorie = listeCategorie[indexPath.row]
        
        self.performSegue(withIdentifier: "showMovie", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        
        let nextScene = segue?.destination as! ViewControllerMovie
        
        // je récupère l’index de la cellule sélectionné
        if (segue?.identifier == "showMovie"){
            //je récupère la catégorie a partir de cette index
            
            print("showMovie \(selectedCategorie)")
            nextScene.currentCategorie = self.selectedCategorie
            
            // on récupère la segue pour pouvoir ensuite envoyer une nouvelle catégorie sur le button Coming Soon
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
