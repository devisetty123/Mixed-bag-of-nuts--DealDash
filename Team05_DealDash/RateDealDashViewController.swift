//
//  RateDealDashViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 11/13/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//RateDealDashViewController class to give feed back and stores it in database
class RateDealDashViewController: UIViewController {
    
    @IBOutlet weak var experienceTF: UITextField!   //experienceTF refers to the experience textfield in storyboard
    @IBOutlet weak var dealsTF: UITextField!        //dealsTF refers to the deal textfield in storyboard
    @IBOutlet weak var suggestionsTV: UITextView!   //suggestionsTV to the suggestions textfield in storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.navigationItem.title = "Rate DealDash"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //This function dismmisses keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //This function makes the view moves up when the textfields begin editing
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue:100)
    }
    
    // this Function executes when textfield completes editing
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
    
    //This function is called when the user taps on the submit button and the deails are succesfull saved to the back4app
    @IBAction func submitBTN(sender: AnyObject) {
        let experiences = experienceTF.text
        let deals = dealsTF.text
        let suggestions = suggestionsTV.text
        if experiences == "" && deals == "" && suggestions == "" {
            displayMessage("Please provide your review")
        }
        let Rate = PFObject(className: "Rating")
        Rate["experience"] = experiences
        Rate["deals"] = deals
        Rate["suggestions"] = suggestions
        Rate["uploader"]=PFUser.currentUser()
        Rate.saveInBackground()
        displayMessage("Thanks for your valuable review...!")
        
    }
    
    //This function is used for alerts
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
}
