//
//  PasswordRecoveryViewController.swift
//  Team05_DealDash
//
//  Created by SriHarsha Devisetty on 12/1/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse

//PasswordRecoveryViewController classs used to recover the password if a user forgot password
class PasswordRecoveryViewController: UIViewController {
   
    @IBOutlet weak var emailTF: UITextField!    //emailTF refers to email textfield in storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //recoverBTN function refers to recover password button in storyboard that sends a link to email provided
    @IBAction func recoverBTN(sender: AnyObject) {
        
        let userEmail=emailTF.text
        PFUser.requestPasswordResetForEmailInBackground(userEmail!){
            (success,error)-> Void in
            if(success){
                let succesMessage="Email was sent you at \(userEmail!)"
                self.displayMessage(succesMessage)
                return
            }
            else{
                let errorMessage:String=error!.userInfo["error"] as! String
                self.displayMessage(errorMessage)
            }
        }
    }
    
    ////displayMessage provides the alert with given message
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
    //cancelBTN function refers to cancel button in storyboard that directs back to login screen
    @IBAction func cancelBTN(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
       
}
