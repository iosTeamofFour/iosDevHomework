//
//  editViewController.swift
//  iosapp1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class editViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    @IBAction func clickImage(_ sender: Any) {
        print("hhh")
    }
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker=UIImagePickerController()
        //imagePicker.sourceType = .camera
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=self
        present(imagePicker,animated: true,completion: nil)
        
    }
    
    func imagePickerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any])
    {
        let selectedImage=info[UIImagePickerController.InfoKey.originalImage]as!UIImage
        self.avatarImage.image=selectedImage
        dismiss(animated: true, completion: nil)
    }
    var contactForEdit : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.text=contactForEdit?.name
        self.phoneNumberText.text=contactForEdit?.phoneNumber
        self.navigationItem.title=contactForEdit?.name
        self.avatarImage.image=contactForEdit?.avatar
        // Do any additional setup after loading the view.
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewClick))
        avatarImage?.addGestureRecognizer(singleTapGesture)
        avatarImage?.isUserInteractionEnabled = true
        
    }
    @objc func imageViewClick()
    {
        let imagePicker=UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=self
        present(imagePicker,animated: true,completion: nil)
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier=="Save")
            {
                contactForEdit=Contact(name:self.nameText.text,phoneNumber: self.phoneNumberText.text,avatar: self.avatarImage.image)
        }
        else{
            
        }
    }
    
}
