//
//  ViewControllerLogin.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit


class ViewControllerLogin: UIViewController, UITextFieldDelegate {

    @IBOutlet var userEmail: UITextField!
    
    @IBOutlet var userPassword: UITextField!
    
    @IBAction func connexionButtonTap(_ sender: Any) {
    
    displayGoodConnection()
    
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("contenu dataBase : \(dataBase)")
        
        dataBase = getDictionary()
        
        print("dataBase save : \(getDictionary())")
        // Nous avons intégrer dataBase = getDictionary() dans viewDidLoad() pour qu'il soit chargé des le debut de l'application
        
        userPassword.delegate = self
        userEmail.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewControllerLogin.dismissKeyboard)))
        
       print("Ceci est un test")
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // fonction pour le retour du clavier
    func dismissKeyboard(){
        
        userPassword.resignFirstResponder()
        userEmail.resignFirstResponder()
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }
    
    
    func displayGoodConnection(){
        
        if (dataBase[userEmail.text!] == "\(userPassword.text!)"){
            print("La connection est OK")
            
            
            //   displayMyAlertMessage(userMessage: "Connexion OK !")
            // Tu n auras plus besoin d afficher une alerte
            self.performSegue(withIdentifier: "discover" ,sender: self )
            
        } else {
            
            print("Les identifiants ne sont pas bons. Réessayer!")
            displayMyAlertMessage(userMessage: "Les identifiants sont incorrects, Recommencez!")
            return
            
            
        }
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    func getDictionary() -> [String : String] {
        // On  récupère object dans le UserDefault stocké à la clé "dictionnary"
        if ( UserDefaults.standard.object(forKey: "dictionary") == nil){
            // On créer une base vide
            let dic : [String: String] = ["user" : "user"]
            // On sauvegarde cette base
            UserDefaults.standard.set(dic, forKey: "dictionary")
        }
        return UserDefaults.standard.object(forKey: "dictionary") as! [String : String]
    }
    
    


}

