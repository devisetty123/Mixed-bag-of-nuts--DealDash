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

//LoginViewController class that validates the user credentials and login into application
class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!     //userNameTF refers to username textfield in the storyboard
    
    @IBOutlet weak var passwordTF: UITextField!     //passwordTF refers to password textfield in the storyboard
    
    @IBAction func loginBTN(sender: AnyObject) {  //loginBTN refers to login button in the storyboard that make user to login
        let username = self.userNameTF.text
        let password = self.passwordTF.text
        
        if username == "" && password == "" {
            displayMessage("Enter e-mail id and password")
        }
        else if username == "" {
            displayMessage("Enter e-mail id")
        }
        else if password == ""{
            displayMessage("Enter password")
        }
        else{
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                if ((user) != nil) {
                    let alert = UIAlertController(title: "Success", message:"Logged In!", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
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
    }
    
    //cancelBTN refers to cancel button in the storyboard that clears all textfields
    @IBAction func cancelBTN(sender: AnyObject) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    //disdismissKeyboard function dismisses the keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //textFieldDidBeginEditing moves view upwards while editing
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue:100)
    }
    
    //textFieldDidBeginEditing moves view to orginal while done editing
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue:100)
    }
    
    //animateViewMoving function moves the view by given value
    func animateViewMoving (up:Bool, moveValue:CGFloat) {
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = (up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //textFieldShouldReturn function hides the keyboard when return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //displayMessage provides the alert with given message
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
}
