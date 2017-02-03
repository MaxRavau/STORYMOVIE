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

        profilPhotoView.layer.cornerRadius = profilPhotoView.frame.size.width / 2
        profilPhotoView.layer.borderWidth = 1.5
        profilPhotoView.layer.borderColor = UIColor.white.cgColor
        
        buttonLogOut.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func profilPhotoButton(_ sender: Any) {
    
    let pickerController = UIImagePickerController()
    
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        
        self.present(pickerController, animated: true, completion: nil)

    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])

    {
      
        profilPhotoView.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
        PFUser.logOutInBackground(block: { (error) -> Void in if error != nil {
            
            PFUser.current()?.username = nil } })
        
        PFUser.logOut()
        
    }
   
}
