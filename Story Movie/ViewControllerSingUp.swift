//
//  ViewControllerSingUp.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerSingUp: UIViewController, UITextFieldDelegate {

    @IBOutlet var adressEmail: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var repeatPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(dataBase)")
        
        repeatPassword.delegate = self
        adressEmail.delegate = self
        password.delegate = self
        // retour clavier
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewControllerSingUp.dismissKeyboard)))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackLogin(_ sender: UIButton) {
    
    self.navigationController?.popViewController(animated: true)
    
    }
    
        // fonction pour le retour du clavier
    func dismissKeyboard() {
        
        adressEmail.resignFirstResponder()
        password.resignFirstResponder()
        repeatPassword.resignFirstResponder()
        
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }

    
    @IBAction func connexionButtonTap(_ sender: Any) {
    
        let emailSuccess: Bool = checkEmailSuccess()
        let passwordSuccess: Bool = checkPasswordSuccess()
        
        if emailSuccess == true && passwordSuccess == true{
            
            
            dataBase[adressEmail.text!] = password.text
            print("\(dataBase)")
            // On utlise UserDefaults pour sauvegarder le dictionnaire dans le téléphone.
            
            setCustomDictionary(dict: dataBase)
            print(Array(UserDefaults.standard.dictionaryRepresentation()))
            self.performSegue(withIdentifier: "Segue.Discover", sender: nil)
            // Le print c'est pour afficher tout le dictionnaire
        }

    
    
    }
    
    
    
    // On a crée une fonction de paramètre dictionnaire [String:String] pour ziper la savegarde du dictionnaire
    func setCustomDictionary(dict: [String: String]) {
        
        UserDefaults.standard.set(dict, forKey: "dictionary")
    }
    
    
    
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ ACTION in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    func checkEmailSuccess() -> Bool{
        
        
        if adressEmail.text?.isEmpty == true{
            displayMyAlertMessage2(userMessage: "Veuillez entrez votre Email !")
            return false
        }
        else if userExistInDataBase(emailEnter: adressEmail.text!) == true {
            
            displayMyAlertMessage2(userMessage: "Cette adresse est déjà utiliser !")
            
            return false
        } else {
            return true
            
        }
        
    }
    
    func checkPasswordSuccess() -> Bool{
        
        if password.text?.isEmpty == true{
            displayMyAlertMessage2(userMessage: "Veuillez entrer votre mot de Passe !")
            return false
        }
        else if repeatPassword.text?.isEmpty == true{
            displayMyAlertMessage2(userMessage: "Veuillez entrer le mot de passe à répeter !")
            return false
        }
            
        else if password.text != repeatPassword.text{
            displayMyAlertMessage2(userMessage: "Les deux mots de passe ne sont pas identiques !")
            return false
        }else{
            return true
        }
        
    }
    
    func displayMyAlertMessage2(userMessage: String){
        
        let myAlert2 = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert2.addAction(okAction2)
        
        self.present(myAlert2, animated: true, completion: nil)
        
        
    }
    func userExistInDataBase(emailEnter: String) -> Bool{
        
        print("l'email récupérer est \(emailEnter)")
        
        for email in dataBase.keys {
            print("email dataBase : \(email)")
            
            // lowercased met toutes les adresses mails de mon dictionnaire en miniscule.
            
            if emailEnter.lowercased() == email.lowercased(){
                
                return true
            }
            
            
        }
        return false
    }
    

}
