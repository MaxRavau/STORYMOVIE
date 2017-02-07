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
    
    override func viewWillAppear(_ animated: Bool) {
       
        if let userPicture = PFUser.current()?["profilePhoto"] as? PFFile {
            print("ADD1")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("ADD2")
                if (error == nil) {
                    print("ADD3")
                    self.profilPhotoView.image = UIImage(data: imageData!)
                    print("ADD4")
                
                }
            })

        }
    }

    
    @IBAction func profilPhotoButton(_ sender: Any) {
    
    let pickerController = UIImagePickerController()
    
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        
        self.present(pickerController, animated: true, completion: nil)
        
        
    

        
    }
    
    func updateCurrentUserProfilePicture(image: UIImage) {
        
        let photo = PFFile(name: PFUser.current()!.username, data: UIImagePNGRepresentation(profilPhotoView.image!)!)
        PFUser.current()!.setObject(photo!, forKey: "profilePhoto")
        PFUser.current()!.saveInBackground()
            
        }
    
    
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
      
        profilPhotoView.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        updateCurrentUserProfilePicture(image: profilPhotoView.image!)
        
        self.dismiss(animated: true, completion: nil)
        
    }

    
    @IBAction func logOutAction(_ sender: Any) {
        
        
        PFUser.logOutInBackground { (error: Error?) in
            
        if error != nil {
                
            } else {
                self.performSegue(withIdentifier: "segue.deconnexion", sender: self)
            }
        }
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

       
}
