//
//  editViewController.swift
//  iosapp1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class editViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    
    var contactForEdit : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.text=contactForEdit?.name
        self.phoneNumberText.text=contactForEdit?.phoneNumber
        self.navigationItem.title=contactForEdit?.name
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier=="Save")
            {
                contactForEdit=Contact(name:self.nameText.text,phoneNumber: self.phoneNumberText.text)
        }
        else{
            
        }
    }
}
