//
//  ViewControllerSingUp.swift
//  Story Movie
//
//  Created by Maxime Ravau on 28/12/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerSingUp: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var adressEmail: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var repeatPassword: UITextField!
    
    @IBOutlet var buttonConfirmer: UIButton!
    
    @IBOutlet var profilPhotoImage: UIImageView!
    
    @IBOutlet var whiteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(dataBase)")
        
        repeatPassword.delegate = self
        adressEmail.delegate = self
        password.delegate = self
        // retour clavier
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewControllerSingUp.dismissKeyboard)))
        // Do any additional setup after loading the view.
        
        buttonConfirmer.layer.cornerRadius = 20
        buttonConfirmer.layer.borderColor = UIColor.black.cgColor
        buttonConfirmer.layer.borderWidth = 1.5
        
        //Ce code permet de faire une image arrondi
        profilPhotoImage.layer.cornerRadius = profilPhotoImage.frame.size.width / 2
        profilPhotoImage.clipsToBounds = true
        profilPhotoImage.layer.borderColor = UIColor.black.cgColor
        profilPhotoImage.layer.borderWidth = 1.5
        
        
        whiteImage.layer.borderWidth = 1.5
        whiteImage.layer.borderColor = UIColor.black.cgColor
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

    @IBAction func takePictureButton(_ sender: Any) {
    
        let pickerController = UIImagePickerController()
        
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        
        self.present(pickerController, animated: true, completion: nil)
        

    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
        
    {
        
        profilPhotoImage.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func connexionButtonTap(_ sender: Any) {
    
        //Étape 1 -> L’utilisateur entre son email
        //Étape 2 -> L’utilisateur entre son mot de passe
        //Étape 3 -> L’utilisateur entre son repeat mot de passe
        //Étape 4 -> L’utilisatateur clique sur le bouton s’enregistrer
        
        
        //Étape5 -> L’application récupère l’email , le mot de passe et le repeat mot de passe
        
        var username = adressEmail.text
        var password = self.password.text
        var repPassword = repeatPassword.text
        
        //Étape6 -> L’application vérifier que l’email ne sois pas vide sinon erreur
        if self.adressEmail.text?.isEmpty == true{
            self.displayMyAlertMessage(userMessage: "Veuillez entrez votre Email !")
        }
        //Étape7 -> L’application vérifie que le mot de passe ne sois pas vide sinon erreur
        else if self.password.text?.isEmpty == true{
            self.displayMyAlertMessage(userMessage: "Veuillez entrer votre mot de Passe !")
        }
        //Étape8 -> L’application vérifier que le repeat mot de passe ne sois pas vide sinon erreur
        else if self.repeatPassword.text?.isEmpty == true{
            self.displayMyAlertMessage(userMessage: "Veuillez entrer votre mot de Passe à répéter!")
        }
        //Étape 9 -> L’application vérifie si le password et le repeat password sont égal sinon erreur
        else if self.password.text != self.repeatPassword.text{
            self.displayMyAlertMessage(userMessage: "Les deux mots de passe ne sont pas identiques !")
        }
        //Étape 10 -> L’application a tout vérifier , elle va donc envoyer à la base de donné serveur ( BAck4App ) l’email et le mot de passe du nouvelle utilisateur
        else {register()
        //Étape 11 -> L’application reçois une réponse de Back4App
        
        //Étape 12 -> L’application traite la réponse, si il n’y a pas d’erreur alors l’inscription a réussi, sinon afficher l’erreur -> error.debugDescription
        
        }
    }

    
// On a crée une fonction de paramètre dictionnaire [String:String] pour ziper la savegarde du dictionnaire
    func setCustomDictionary(dict: [String: String]) {
        
        UserDefaults.standard.set(dict, forKey: "dictionary")
    }
    
    
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert2 = UIAlertController(title: "Erreur", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert2.addAction(okAction2)
        
        self.present(myAlert2, animated: true, completion: nil)
        
        
    }

    
    func register(){
        
        
        let username = adressEmail.text
        let password = self.password.text
        
        // Defining the user object
        let user = PFUser()
        user.username = username
        user.password = password
        
        let profileImageData = UIImageJPEGRepresentation(profilPhotoImage.image!, 1)
        
        if(profileImageData != nil){
            
            let profileImageFile = PFFile(data: profileImageData!)
            user.setObject(profileImageFile!, forKey: "profile_Picture")
            
        }
        
//j'enregistre
        user.signUpInBackground {
            (success, error) -> Void in
            
// si il y a une erreur
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.displayMyAlertMessage(userMessage: "Cette Adresse Mail est déjà utilisé!")
                print("Il y a une erreur \(error.debugDescription)")
// On met un un message d'alerte
                
            } else {
// Sinon on dit on met un mesage d'alerte positif
                self.performSegue(withIdentifier: "segue.discover", sender: self)
                
            }
        }
    }
}
        

    
    
        
       
