//
//  ViewControllerChangeEmail.swift
//  Story Movie
//
//  Created by Maxime Ravau on 06/02/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse


class ViewControllerChangeEmail: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSave.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSaveTap(_ sender: Any) {
    
    let username = usernameTextField.text
    let email = usernameTextField.text
        
        let user = PFUser.current()!
        user["username"] = username
        user["email"] = email
    
        user.saveInBackground()
        displayMyAlertMessage(userMessage: "Confirmation votre Email a bien été modifié !")
    }

    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

    
    
}
