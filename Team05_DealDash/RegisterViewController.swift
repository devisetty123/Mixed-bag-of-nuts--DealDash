//
//  RegisterViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/7/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerLBL: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var regPasswordTF: UITextField!
    
    @IBOutlet weak var confPasswordTF: UITextField!
    
    
    @IBAction func signupBTN(sender: AnyObject) {
        let fName:String? = String(firstNameTF.text!)
        let lName:String? = String(lastNameTF.text!)
        let email:String? = String(emailTF.text!)
        let pas:String? = String(regPasswordTF.text!)
        let cpas:String? = String(confPasswordTF.text!)
        //let fName = String(firstNameTF.text!)
        if fName == nil {
            displayMessage("Enter First Name")
        }
        else if lName == nil{
            displayMessage("Enter Last name")
        }
        else if email == nil{
            displayMessage("Enter email address")
        }
        else if pas == nil{
            displayMessage("Enter password")
        }
        else if cpas != pas{
            displayMessage("Password mismatch. Please eneter the password again")
        }
        else{
            
        }
    }
    
    
    @IBAction func regCancelBTN(sender: AnyObject) {
        firstNameTF.text = ""
        lastNameTF.text = ""
        emailTF.text = ""
        regPasswordTF.text = ""
        confPasswordTF.text = ""
    }
    
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
