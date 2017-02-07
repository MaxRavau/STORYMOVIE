//
//  ViewControllerMovie.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerMovie: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var selectedIndex: Int = 0
    var selectedMovie: Movie?
    
    @IBOutlet var labelCategorie: UILabel!
    @IBOutlet var myCollectionView: UICollectionView!
    
    
    var currentCategorie: Categorie?
    // Variable créer pour faire passer la variable avec le segue de tableView ControllerDiscover a ViewControllerMovie
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewControllerMovie \(currentCategorie?._titre)")
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
        
        
        
        return ((currentCategorie?._listeMovie.count)!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index: Int = indexPath.row
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype3", for: indexPath) as! CollectionViewCellMovie
        
        let movie: Movie = (currentCategorie?._listeMovie[index])!
        cell.imageCover.image = movie._image
        
        labelCategorie.text = currentCategorie?._titre
        
        print("\(index)")
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedMovie = currentCategorie?._listeMovie[indexPath.row]
        
        performSegue(withIdentifier: "AG", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        
        if (segue?.identifier == "AG"){
            
            let nextScene = segue?.destination as! TableViewControllerDescription
            
            nextScene.currentMovie = self.selectedMovie
            
        }
    }
    
}

