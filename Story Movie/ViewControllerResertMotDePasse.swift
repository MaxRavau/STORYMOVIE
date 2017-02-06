//
//  ViewControllerResertMotDePasse.swift
//  Story Movie
//
//  Created by Maxime Ravau on 02/02/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerResertMotDePasse: UIViewController {

    @IBOutlet var adressMailTextField: UITextField!
    
    @IBOutlet var buttonEnvoyer: UIButton!
    @IBOutlet var buttonAnnuler: UIButton!
    @IBOutlet var whiteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonEnvoyer.layer.cornerRadius = 15
        buttonEnvoyer.layer.borderWidth = 1.5
        buttonEnvoyer.layer.borderColor = UIColor.black.cgColor
        buttonAnnuler.layer.cornerRadius = 15
        buttonAnnuler.layer.borderWidth = 1.5
        buttonAnnuler.layer.borderColor = UIColor.black.cgColor
        
        whiteImage.layer.borderWidth = 1.5
        whiteImage.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func envoyerButtonTap(_ sender: Any) {
    
    let adressMail = adressMailTextField.text
    
        if (adressMail?.isEmpty)!{
            
            // Afficher un message d'avertissement
            let message: String = "Veuillez entrer votre Mail"
            displayMessage(userMessage: message)
            return
        }
        
        PFUser.requestPasswordResetForEmail(inBackground: adressMail!) { (success: Bool, error: Error?) in
            if(error != nil){
                
                let message: String = error!.localizedDescription
                self.displayMessage(userMessage: message)
             // Afficher le message d'erreur
            }else{
              
                let message: String = "Un e-mail vous a été envoyé \(adressMail!)"
                self.displayMessage(userMessage: message)
            // Afficher le message du succès
            
                
            
            }
        }
    }
    @IBAction func buttonAnnulerTap(_ sender: Any) {
    
    self.navigationController?.popViewController(animated: true)
    
    }
    
    func displayMessage(userMessage: String){
        
        let alert = UIAlertController(title: "ALERTE", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { ACTION in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func annulerButtonTap(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
    
    }
   
    
}
