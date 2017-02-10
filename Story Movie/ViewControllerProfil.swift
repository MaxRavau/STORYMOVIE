//
//  ViewControllerProfil.swift
//  Story Movie
//
//  Created by Maxime Ravau on 02/02/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerProfil: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var profilPhotoView: UIImageView!
    @IBOutlet var buttonLogOut: UIButton!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        
    }
    
    func initUI(){
        
        configureButtons()
        
        
    }

    func configureButtons(){
        
        self.profilPhotoView.layer.cornerRadius = self.profilPhotoView.frame.size.width / 2
        self.profilPhotoView.layer.borderWidth = 1.5
        self.profilPhotoView.clipsToBounds = true
        self.profilPhotoView.layer.borderColor = UIColor.white.cgColor
        buttonLogOut.layer.cornerRadius = 10

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
    
    
    }
    // la fonction qui met a jour la photo du rond
    override func viewWillAppear(_ animated: Bool) {
       
      getUserProfilePicture()
    
    }
    //la fonction qui permet d'ajouter la photo de profil de l'utilisateur dans le rond
    func getUserProfilePicture(){
        
        if let userPicture = PFUser.current()?["profilePhoto"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    self.profilPhotoView.image = UIImage(data: imageData!)
                    
                    
                }
            })
            
        }

        
    }
    
    //Quand tu cliques sur le button Modifié la librairy s'ouvre
    @IBAction func profilPhotoButton(_ sender: Any) {
    
        lauchPhotoLibrary()
        
        
    }
    //la fonction qui me permet d'ouvrir la librairy photo
    func lauchPhotoLibrary(){
        
        let pickerController = UIImagePickerController()
        
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        
        self.present(pickerController, animated: true, completion: nil)
 
        
    }
    //la fonction qui permet de sauvegarder la photo
    func saveProfilePicture(){
        
        let imageData: Data = UIImageJPEGRepresentation(profilPhotoView.image!, 0.25)!
        
        let profileImageFile = PFFile(data: imageData)
        
        PFUser.current()?.setObject(profileImageFile!, forKey: "profilePhoto")
        
        PFUser.current()?.saveInBackground(block: { (success: Bool, error: Error?) in
            
            if success == true{
                
                print("Saving")
            }
        })
    }
    // la fonction qui sert a selectionner la photo et l'enregistrer avec saveProfilePicture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("get original image, prends une photo")
            profilPhotoView.image = image
            saveProfilePicture()
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
   
    // la fonction qui permet de me déconnecter de l'application
    @IBAction func buttonDeconnexionTap(_ sender: UIButton) {
    
        let alert = UIAlertController(title: "Deconnexion!", message: "Merci de votre Visite, A très Vite!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    
    
    }
    
    // la fonction qui permet d'émettre des messages
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

       
}
