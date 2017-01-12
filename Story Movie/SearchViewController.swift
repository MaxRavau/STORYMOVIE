//
//  SearchViewController.swift
//  Story Movie
//
//  Created by Maxime Ravau on 04/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var SearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SearchViewController.dismissKeyboard)))
        
    }
    
    
    func createSearchBar(){
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
        
    }
    
    func dismissKeyboard() {
        
        SearchBar.resignFirstResponder()
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }
    

    
    }
