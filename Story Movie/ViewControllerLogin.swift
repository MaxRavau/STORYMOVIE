//
//  ViewControllerLogin.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse
import LocalAuthentication

class ViewControllerLogin: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var buttonConnexion: UIButton!

    @IBOutlet var buttonInscription: UIButton!
    
    @IBOutlet var userEmail: UITextField!
    
    @IBOutlet var userPassword: UITextField!
    
    
    
    @IBAction func connexionButtonTap(_ sender: Any) {
    
    //displayGoodConnection()
    PFUser.logInWithUsername(inBackground: userEmail.text!, password: userPassword.text!) { (user, error) in
        if error == nil{
            
            print(" On a pas d'erreur la connexion a bien fontionné")
            self.performSegue(withIdentifier: "discover" ,sender: self )
            
        }else{
            self.displayMyAlertMessage(userMessage: "Les identifiants sont incorrects, Recommencez!")
            print("Il y a une erreur \(error.debugDescription)")
        }
        
        }
        
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
        
        buttonConnexion.layer.cornerRadius = 15
        buttonInscription.layer.cornerRadius = 15
        buttonConnexion.layer.borderColor = UIColor.white.cgColor
        buttonConnexion.layer.borderWidth = 1.5
        buttonInscription.layer.borderColor = UIColor.white.cgColor
        buttonInscription.layer.borderWidth = 1.5
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) in
           print("Object has been saved.")
        }
        
        
        
        
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

