//
//  ViewController.swift
//  secondHomework
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var picture: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var answer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonClick(_ sender: Any) {
        let userName = name.text;
        let inputPassword = password.text;
        if userName == "admin" && inputPassword == "123"{
            answer.text = "登陆成功！"
            answer.textColor = UIColor.green
            
        }else{
            answer.text = "登陆失败！"
            answer.textColor = UIColor.red
        }
    }

}
