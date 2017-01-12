//
//  TableViewControllerPolicy.swift
//  Story Movie
//
//  Created by Maxime Ravau on 02/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewControllerPolicy: UITableViewController {

    
    var listeTitre: [String] = ["", "INFORMATION WE COLLECT","INFORMATION USAGE", "ACCESSING YOUR INFORMATION", "THIRD-PARTY LINKS AND CONTENT", "CALIFORNIA ONLINE PROVACY PROTECTIONACT COMPLIANCE", "CHILDREN'S ONLINE PRIVACY PROTECTION ACT COMPLIANCE", "YOUR CONSENT", "CONTACTING US", "CHANGES TO THIS POLICY"]
    
    var listeSousTitre: [String] = ["This policy applies to all information collected or submitted on Storymovie apps for Iphone and any other devices and platforms.", "We store information about how you browse the app, movies and lists you look at, searches, and movies added to your list. None of this is personally identifiable. We do not store any personal information about you.", "We use the information we collect to operate and improve our apps and customer support. We do not share your personal information with outside parties except to the extent necessary to accomplish Story Movie functionnality", "We may share anonymous, aggregate statistics with outside parties, such as how many movies people add to their list and popular searches. In the future, we may sell to, buy, merge with, or partner with other businesses. In such transactions, user information may be among the tranferred assets.", "You may access or change your information or delete your account at any time by going info Setting > iCloud on your IOS device.", "Story Movie use the Movie DataBase(TMDB) for all movie information. TMDB has their own independent privacy Polity, ans we have no responsability or liability for their content or activities.", " We comply with the California Online Privacy Protection Act. We therefore will not distribute your personal information to outside without your consent.", "We never collect or maintain information at our website from those we actually know are under 13, and no part of our app is structured to attract anyone under 13", "By using our apps, you consent to our privacy policy.", "If you have questions regarding this privacy policy, you may email max.ravau@gmail.com. If we decide to change our privacy policy, we will post those changes on this page and update the Privacy Policy modification date below.  This policy was last modified on Janvier 2, 2017"]
    
    
    
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
        return listeTitre.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype6", for: indexPath) as! TableViewCellPolicy

        cell.labelTitre.text = listeTitre[indexPath.row]
        cell.labelSoustitre.text = listeSousTitre[indexPath.row]

        return cell
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
