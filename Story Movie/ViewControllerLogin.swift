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
    
    @IBOutlet var whiteImage: UIImageView!
    
    
    
    

    @IBAction func connexionButtonTap(_ sender: Any) {
        
        startLoginRequest()
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        initUI()
        
        
        
    }
    
    func initUI(){
        
        configureTextField()
        configureButtons()
        
    }
    
    func startLoginRequest(){
        
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
    
    
    
    func configureButtons(){
        
        buttonConnexion.layer.cornerRadius = 15
        buttonInscription.layer.cornerRadius = 15
        buttonConnexion.layer.borderColor = UIColor.black.cgColor
        buttonConnexion.layer.borderWidth = 1.5
        buttonInscription.layer.borderColor = UIColor.black.cgColor
        buttonInscription.layer.borderWidth = 1.5
        
        whiteImage.layer.borderWidth = 1.5
        whiteImage.layer.borderColor = UIColor.black.cgColor
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTextField() {
        
        userPassword.delegate = self
        userEmail.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewControllerLogin.dismissKeyboard)))
        
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
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue){}
    
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
}

