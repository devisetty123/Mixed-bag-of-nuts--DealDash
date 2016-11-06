//
//  LoginViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/7/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginViewController: UIViewController {
    
    @IBOutlet weak var dealDashLBL: UILabel!
    
    @IBOutlet weak var userNameTF: UITextField!

    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginBTN(sender: AnyObject) {
        let username = self.userNameTF.text
        let password = self.passwordTF.text
        
        PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
            
            if ((user) != nil) {
                let alert = UIAlertController(title: "Success", message:"Logged In!", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
                //                    self.presentViewController(alert, animated: true){}
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("HomeNav")
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
            } else {
                let alert = UIAlertController(title: "Error!", message:"Username and password do not match. Please check your credentials.", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
                self.presentViewController(alert, animated: true){}
            }
        })

        
    }
    
    
    
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
            let user:String? = String(userNameTF.text)
            let pass:String? = String(passwordTF.text)
            if user == "" {
                displayMessage("Enter username")
            }
            else if pass == ""{
                displayMessage("enter passwoard")
            }
            else{
                
               // _ = segue.destinationViewController as! HomeViewController
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
