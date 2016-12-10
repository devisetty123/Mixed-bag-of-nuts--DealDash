//
//  RegisterViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/7/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//RegisterViewController class allows the new user to register into application
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!        //firstNameTF refers to firstname textfield in storyboard
    
    @IBOutlet weak var lastNameTF: UITextField!         //lastNameTF refers to lastname textfield in storyboard
    
    @IBOutlet weak var emailTF: UITextField!            //emailTF refers to email textfield in storyboard
    
    @IBOutlet weak var regPasswordTF: UITextField!      //regPasswordTF refers to password textfield in storyboard
    
    @IBOutlet weak var confPasswordTF: UITextField!     //confPasswordTF refers to conform password textfield in storyboard
    
    //signupBTN function refers to sing up button in storyboard that registers the new user
    @IBAction func signupBTN(sender: AnyObject) {
        let firstName:String? = String(firstNameTF.text!)
        let lastName:String? = String(lastNameTF.text!)
        let email = self.emailTF.text
        let password = self.regPasswordTF.text!
        let confPassword = self.confPasswordTF.text!
        let finalEmail = email
        if firstName == "" || lastName == "" || email == "" || password == "" || confPassword == ""{
            displayMyAlertMessage("All fields are Mandatory")
        }
        else if confPassword != password{
            displayMyAlertMessage("Password mismatch. Please enter the password again")
        }
        else{
            let newUser = PFUser()
            let userObject = Users()
            newUser.username = email
            newUser.password = password
            newUser.email = finalEmail
            userObject.firstName = firstNameTF.text!
            userObject.lastName = lastNameTF.text!
            userObject.eMail = emailTF.text!
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                if ((error) != nil) {
                    let alert = UIAlertController(title: "Error", message:"\(error)", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
                    self.presentViewController(alert, animated: true){}
                } else {
                    let myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                        self.dismissViewControllerAnimated(true, completion:nil);
                    }
                    
                    myAlert.addAction(okAction);
                    self.presentViewController(myAlert, animated:true, completion:nil);
                    
                }
            })
            
        }
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
 
    //textFieldShouldReturn function hides the keyboard when return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //regCancelBTN refers to cancel button in the storyboard that clears all textfields
    @IBAction func regCancelBTN(sender: AnyObject) {
        firstNameTF.text = ""
        lastNameTF.text = ""
        emailTF.text = ""
        regPasswordTF.text = ""
        confPasswordTF.text = ""
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //displayMyAlertMessage provides the alert with given message
    func displayMyAlertMessage(userMessage:String)
    {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
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
    
}
