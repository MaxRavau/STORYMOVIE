//
//  ViewControllerFavorite.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerFavorite: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    var selectedMovie: Movie?
    
    var currentMovie: PFObject?
    
    var listeFavorite = [PFObject]()
    
    
    @IBOutlet var myCollectionViewFavorite: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.myCollectionViewFavorite.delegate = self
        
        self.myCollectionViewFavorite.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listeFavorite.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let listObject: PFObject = listeFavorite[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype5", for: indexPath) as! CollectionViewCellFavorite
        
        if let userPicture = listObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.imageCoverFavorite.image = UIImage(data: imageData!)
                    
                }
                
            })
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //chaque fois que arrives sur cette page tu mets à jour le contenu de la page
        
        super.viewWillAppear(animated)
        
        
        
        myCollectionViewFavorite.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedMovie = myPlaylist[indexPath.row]
        
        self.performSegue(withIdentifier: "AD", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "AD"){
            
            let nextScene = segue.destination as! TableViewControllerDF
            
            nextScene.currentMovie = self.selectedMovie
            
        }
        
    }
    
    func refreshUser(){
        
        let user = PFUser.current()
        
        user?.fetchInBackground(block: { (object:PFObject?,error: Error?) in
            
            
            
        })
        
    }
    
    
    func refreshMovie(){
        
        let user : PFUser = PFUser.current()!
        
        //On crée la fonction getListFavorite()
        let listeFavId = user["liste_favorite"] as! [String]
        
        
        for movieId in listeFavId{
            
            
            let query = PFQuery(className:"Movie")
            query.getObjectInBackground(withId: movieId) { (movie, error) in
                
            }
            
            
            
        }
        
        
    }
    
    
    
    
    
}





