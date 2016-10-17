//
//  PostViewController.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha on 10/6/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    
    @IBOutlet weak var categoryTF: UITextField!
    
    @IBOutlet weak var offerPercentge: UITextField!
    
    @IBOutlet weak var attachFile: UITextField!
    
    //@IBOutlet weak var description: UITextView!
    
    @IBOutlet weak var date: UIDatePicker!
    
    
    @IBAction func postBTN(sender: AnyObject) {
        
        displayMessage("Your offer has been Posted...!")
    }
    
    @IBAction func postCancelBTN(sender: AnyObject) {
        categoryTF.text = ""
        offerPercentge.text = ""
        attachFile.text = ""
        
    }
    
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
    
    @IBOutlet weak var dropDown: UIPickerView!
    var list = ["Food","Clothing","Electronics","Books","Sports","Home & Furniture", "Kitchen Appliances"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return list.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        self.view.endEditing(true)
        return list[row]      
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.categoryTF.text = self.list[row]
        self.dropDown.hidden = true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField == self.categoryTF {
            self.dropDown.hidden = false
            //if you dont want the users to se the keyboard type:
            
           // textField.endEditing(true)
        }

    }

}
