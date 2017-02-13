//
//  ViewControllerMovie.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerMovie: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var selectedIndex: Int = 0
    var selectedMovie = [PFObject]()
    
    var listeMovie = [PFObject]()
    
    @IBOutlet var labelCategorie: UILabel!
    @IBOutlet var myCollectionView: UICollectionView!
    
    
    //var currentCategorie: Categorie?
    
    
    // Variable créer pour faire passer la variable avec le segue de tableView ControllerDiscover a ViewControllerMovie
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovie()
        
        // Do any additional setup after loading the view.
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        return listeMovie.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype3", for: indexPath) as! CollectionViewCellMovie
        
        let categorieObject: PFObject = listeMovie[indexPath.row]
        
        
        if let userPicture = categorieObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.imageCover.image = UIImage(data: imageData!)
                }
            })
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedMovie = [listeMovie[indexPath.row]]
        
        performSegue(withIdentifier: "AG", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        
        if (segue?.identifier == "AG"){
            
            let nextScene = segue?.destination as! TableViewControllerDescription
            
            nextScene.movie = self.listeMovie
            
        }
    }
    
    func getMovie(){
        
        let query = PFQuery(className:"Movies")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.listeMovie = objects!
                self.myCollectionView.reloadData()
                if let listeMovie = objects {
                    for movie in listeMovie {
                        let title = movie["title"]
                        let sousTitle = movie["sousTitle"]
                        let annee = movie["annee"]
                        let minutes = movie["minutes"]
                        
                        print("\(title) \(sousTitle)")
                        print("\(minutes)")
                        print("\(annee)")
                        
                    }
                }
            }
            
        }
    }
}

