//
//  backViewController.swift
//  iosapp1
//
//  Created by Apple on 2019/10/8.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class backViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func BackToLogin(_ sender: UIButton) {
        
        performSegue(withIdentifier: "BackToLogin", sender: self)
    }
}
