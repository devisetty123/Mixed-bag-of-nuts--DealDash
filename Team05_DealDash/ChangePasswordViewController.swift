//
//  ChangePasswordViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 11/13/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//ChangePasswordViewController class to change current password
class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var newPasswordTF: UITextField!      //newPasswordTF refers to the new password textfield
    @IBOutlet weak var confirmPasswordTF: UITextField!  //confirmPasswordTF refers to the comfirm password textfield
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Change Password"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ths function is called when user taps on the return button
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //this function dismissses the keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //This function is called when the textfield starts editing
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue:100)
    }
    
    //This function is called when the textfield starts editing
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue:100)
    }
    
    // this function animates the view
    func animateViewMoving (up:Bool, moveValue:CGFloat) {
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = (up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    
    //this function is called when the user taps on the save button and information stores in the back4app
    @IBAction func saveBTN(sender: AnyObject) {
        
        if (!(newPasswordTF.text?.isEmpty)! && (newPasswordTF.text != confirmPasswordTF.text)){
            displayMessage("Passwords do not match")
            return
        }
        else if (newPasswordTF.text?.isEmpty)! && (confirmPasswordTF.text?.isEmpty)!{
            displayMessage("Enter all fields")
            return
        }
        else if !((newPasswordTF.text)?.isEmpty)!{
            let myUser=PFUser.currentUser()
            let userPassword = newPasswordTF.text
            myUser?.password=userPassword
            myUser?.saveInBackground()
            displayMessage("Password changed Succesfully")
        }
    }
    
    //This function is used to display alert
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
}
