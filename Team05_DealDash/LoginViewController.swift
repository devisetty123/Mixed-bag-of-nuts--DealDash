//
//  LoginViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/7/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var dealDashLBL: UILabel!
    
    @IBOutlet weak var userNameTF: UITextField!

    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBAction func loginBTN(sender: AnyObject) {
        var user = String(UTF8String: userNameTF.text!)
        var pass = String(UTF8String: passwordTF.text!)
        
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
            if user == nil {
                displayMessage("Enter username")
            }
            else if pass == nil{
                displayMessage("enter passwoard")
            }
            else{
                
                _ = segue.destinationViewController as! HomeViewController
            }
        }
        
        
    }
    
    @IBAction func cancelBTN(sender: AnyObject) {
        userNameTF.text = ""
        passwordTF.text = ""
              
    }
    
    @IBAction func unwindToLogin(sender: UIStoryboardSegue) {
        _ = sender.sourceViewController as! RegisterViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }

}
