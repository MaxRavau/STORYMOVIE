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
    
    
    var selectedMovie: PFObject?
    
    var listeMovie = [PFObject]()
    
    @IBOutlet var labelCategorie: UILabel!
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    var currentCategorie: PFObject?
    
    
    // Variable créer pour faire passer la variable avec le segue de tableView ControllerDiscover a ViewControllerMovie
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        initUI()
        
    }
    
    func initUI(){
        
        getTitle()
        getMovie()
    }
    
    
    func getTitle(){
        
        var categorieTitle = currentCategorie?["title"]
        
        labelCategorie.text = categorieTitle as! String?
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        // On met une affiche de chaque film
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        //On return la liste de film entiere
        return listeMovie.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // dans cette fonction on return juste la Cover du film
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype3", for: indexPath) as! CollectionViewCellMovie
        
        cell.imageCover.image = UIImage()
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
        
        print("ADD")
        
        // on selectionne le film  dans la liste de film
        self.selectedMovie = listeMovie[indexPath.row]
        
        print("ADD1")
        // Quand on a sélectionner le film On passe a la description du film
        performSegue(withIdentifier: "AG", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        
        // Si la segue s'appelle AG
        if (segue?.identifier == "AG"){
            // alors la prochaine page de destination c'est le tableViewControllerDescription
            let nextScene = segue?.destination as! TableViewControllerStaticDescription
            // la page d'après on récupère le détail du film de la listeMovie
            print("ADD2")
            
            nextScene.currentMovie = self.selectedMovie!
            print("ADD3")
        }
    }
    
    func getMovie(){
        
        let query = PFQuery(className:"Movies")
        query.whereKey("categorie_movie", equalTo: currentCategorie)
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
                        let duree = movie["duree"]
                        
                        print("\(title) \(sousTitle)")
                        print("\(duree)")
                        print("\(annee)")
                        
                    }
                }
            }
            
        }
    }
}

