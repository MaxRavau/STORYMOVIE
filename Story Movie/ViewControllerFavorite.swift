//
//  ViewControllerFavorite.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerFavorite: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    var selectedMovie: Movie?
    
    
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
        
        return myPlaylist.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index: Int = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype5", for: indexPath) as! CollectionViewCellFavorite
        
        let movie: Movie = (myPlaylist[index])
        
        cell.imageCoverFavorite.image = movie._image
        
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
    
}
