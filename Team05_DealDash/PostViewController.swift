//
//  PostViewController.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha on 10/6/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class PostViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var descriptionTF: UITextView!
    
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    
    @IBOutlet weak var offerPercentge: UITextField!
    
    @IBOutlet weak var attachFile: UITextField!
       @IBOutlet weak var date: UIDatePicker!
    
    
    @IBAction func postBTN(sender: AnyObject) {
        let description = descriptionTF.text
        let address = addressTF.text
        let category = categoryTF.text
       let offer = offerPercentge.text
        
        if selectedIMG.image==nil && description==nil && address==nil && category==nil && offer==nil{
            print("enter all fields")
        }
        else{
            let posts = PFObject(className: "Posts")
            posts["description"] = description
            posts["address"] = address
             posts["category"] = category
            posts["offer"]=offer
            
            posts["uploader"]=PFUser.currentUser()
            print("hi")
            posts.saveInBackgroundWithBlock({
                (success: Bool, error: NSError?) -> Void in
                
                if error == nil {
                    /**success saving, Now save image.***/
                    
                    //create an image data
                    let imageData = UIImagePNGRepresentation(self.selectedIMG.image!)
                    //create a parse file to store in cloud
                   let parseImageFile = PFFile(name: "myImage", data: imageData!)
                   
                    posts["imageFile"] = parseImageFile
                   // print(parseImageFile)
                    posts.saveInBackgroundWithBlock({
                        (success: Bool, error: NSError?) -> Void in
                        
                        if error == nil {
                            //take user home
                            print("data uploaded")
                            //self.performSegueWithIdentifier("goHomeFromUpload", sender: self)
                            
                        }else {
                            
                            print(error)
                        }
                        
                        
                    })
                    
                    
                }else {
                    print(error)
                    
                }
                
            })
            

            
            
            
        }
        
        
        
        
        
        displayMessage("Your offer has been Posted...!")
    }
    
    @IBAction func postCancelBTN(sender: AnyObject) {
        categoryTF.text = ""
        offerPercentge.text = ""
        selectedIMG.image=nil
        
    }
    
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
   
    @IBOutlet weak var selectedIMG: UIImageView!
    
    @IBAction func uploadimageBTN(sender: AnyObject) {
    
    
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.selectedIMG.image = image
    }
    

    
    
    
    var list = ["Food","Clothing","Electronics","Books","Sports","Home & Furniture", "Kitchen Appliances"]
    var picker=UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        categoryTF.inputView = picker
        }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTF.text = list[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
