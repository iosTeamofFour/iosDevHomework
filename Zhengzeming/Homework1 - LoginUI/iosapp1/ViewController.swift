//
//  ViewController.swift
//  iosapp1
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginText: UITextField!
    
    @IBAction func findBackPassword(_ sender: Any) {
         alert(_title: "找回密码", _message: "您点击了找回密码")
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        userName.resignFirstResponder()
        password.resignFirstResponder()
    }
    @IBAction func login(_ sender: Any) {
        if(userName.text=="zoom"&&password.text=="123456")
        {
            loginText.text="Hello,zoom"
            alert(_title: "login success", _message: "Welcome!!!")
        }
        else
        {
            loginText.text="wrong!!!"
            alert(_title: "login failed", _message: "login failed,please input the right userName and password")
        }
    }
    
    @IBAction func rememberButton(_ sender: Any) {
    }
    
    func alert(_title:String,_message:String)
    {
        let alertController=UIAlertController(title:_title,message:_message,preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler: nil)
        let destructiveAction = UIAlertAction(title:"Back",style:UIAlertAction.Style.cancel, handler: nil)

        alertController.addAction(defaultAction)
        alertController.addAction(destructiveAction)
        present(alertController,animated:true,completion:nil)
//        let alertController=UIAlertController(title:_title,message:_message,preferredStyle:UIAlertController.Style.actionSheet)
//                let defaultAction = UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler: nil)
//        let destructiveAction = UIAlertAction(title:"Back",style:UIAlertAction.Style.cancel, handler:{(action:UIAlertAction!)->Void in print("hhh")})
//                alertController.addAction(defaultAction)
//                alertController.addAction(destructiveAction)
//          present(alertController,animated:true,completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

