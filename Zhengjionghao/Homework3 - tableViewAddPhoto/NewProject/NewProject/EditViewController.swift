//
//  EditViewController.swift
//  NewProject
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var name: UITextView!
    
    @IBOutlet weak var foodImage: UIImageView!
    var food : Food? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = food?.foodName
        foodImage.image = food?.foodImage
        
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(takePhoto))
        foodImage?.addGestureRecognizer(singleTapGesture)
        foodImage?.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        print("hello")
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]){
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            
            food = Food(name: self.name.text, img: self.foodImage.image)
        }
        
    }
 

}
