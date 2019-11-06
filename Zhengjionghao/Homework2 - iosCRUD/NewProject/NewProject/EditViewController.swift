//
//  EditViewController.swift
//  NewProject
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    
    @IBOutlet weak var name: UITextView!
    
    var food : Food? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = food?.foodName
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            
            food = Food(name: self.name.text)
        }
        
    }
 

}
