//
//  ViewControllerFavorite.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerFavorite: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var selectedMovie: PFObject?
    
    var listeFavorite = [PFObject]()
    
    
    @IBOutlet var myCollectionViewFavorite: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.myCollectionViewFavorite.delegate = self
        
        self.myCollectionViewFavorite.dataSource = self
        
        initUI()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        
        
        
        
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("count listeFavorite \(listeFavorite.count)")
        return listeFavorite.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype5", for: indexPath) as! CollectionViewCellFavorite
        
        
        cell.imageCoverFavorite.image = UIImage()
        let listObject: PFObject = listeFavorite[indexPath.row]
        
        
        cell.backgroundColor = UIColor.red
        if let userPicture = listObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                print("erreur Image")
                if (error == nil) {
                    print("ex : \(imageData!)")
                    print("get user picture no error")
                    cell.imageCoverFavorite.image = UIImage(data: imageData!)
                
                }
            })
        }
        
        return cell
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //chaque fois que arrives sur cette page tu mets à jour le contenu de la page
        myCollectionViewFavorite.reloadData()
        
        super.viewWillAppear(animated)
        
        
        refreshUser()
        getFavorisList()
        
        
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedMovie = listeFavorite[indexPath.row]
        
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
    
    
    func getFavorisList(){
        
        print("1")
        self.listeFavorite.removeAll()
        let user : PFUser = PFUser.current()!
        print("2")
        if let listeFavId = user["favoriteMovieIdList"] as? [String] {
        
            
            
            var movieDownloadedCount : Int =  0
            
            for movieId in listeFavId{
                print("4")
                //On fait une boucle sur la listeFavorite
                let query = PFQuery(className:"Movies")
                
                print("5")
                query.cachePolicy = PFCachePolicy.cacheThenNetwork
                query.getObjectInBackground(withId: movieId) { (movie, error) in
                    
                    if(movie != nil){
                    
                        print("6")
                        movieDownloadedCount += 1
                        print("\(movieId)")
                        //Et on fait un getObjectInBackground le movie a partir d'un objectID
                        
                        self.listeFavorite.append(movie!)
                        
                        print("7 movie count \(movieDownloadedCount) && listfav count \(listeFavId.count)")
                        
                        if(movieDownloadedCount == listeFavId.count){
                            self.listeFavorite.sort(by: { $0.updatedAt?.compare($1.updatedAt!) == .orderedAscending})
                            
                            self.myCollectionViewFavorite.reloadData()
                        }
                    }

                }
                
                
                
            }
            
            

            // Sa permet d'afficher la collectionView en prenant compte que le tableau est rempli
        }
        
         
    }
    
}
    
    
    
    
    






