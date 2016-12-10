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
    
    @IBOutlet weak var descriptionTF: UITextView!       //descriptionTF refers to the description text field in storyboard
    @IBOutlet weak var storeNameTF: UITextField!        //storeNameTF refers to the storename text field in storyboard
    @IBOutlet weak var typeTF: UITextField!             //typeTF refers to the type of offer text field in storybord
    @IBOutlet weak var addressTF: UITextField!          //addressTF refers to the address or website link in the storyboard
    @IBOutlet weak var categoryTF: UITextField!         //categoryTF refers to the type category
    @IBOutlet weak var offerTF: UITextField!            //offerTF refers to the amount of offer or offer in percentage in storyboard
    @IBOutlet weak var datePicker: UIDatePicker!        //datePicker refers to toselect the end date of the offer
    var endDate=""
    var categoryType:String = ""
    
    //This action is performed when user clicks on the post buuton and offer stores in the back4app
    @IBAction func postBTN(sender: AnyObject) {
        if self.selectedIMG.image == nil || descriptionTF.text! == "" || addressTF.text! == "" || categoryTF.text! == "" || offerTF.text! == "" || storeNameTF.text! == "" {
            self.displayMessage("All fields are required")
        }
        else if typeTF.text != "Online" && typeTF.text != "Instore"{
            self.displayMessage("Select the type of offer from the list")
        }
            
        else if categoryTF.text != "Food" && categoryTF.text != "Clothing" && categoryTF.text != "Electronics" && categoryTF.text != "Books" && categoryTF.text != "Sports" && categoryTF.text != "Furniture" && categoryTF.text != "KitchenAppliances"{
            self.displayMessage("Select the type of category from the list")
        }
        else{
            if typeTF.text=="Online"{
                creatingClass()
                displayMessage("Your offer has been posted...!")
                
            }
                
            else {
                creatingClassInstore()
                displayMessage("Your offer has been posted...!")
            }
            
        }
    }
    
    //textFieldShouldReturn function hides the keyboard when the user taps on the return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //This action is peformed when the user clicks on the cancel button and it resets all the textfields
    @IBAction func postCancelBTN(sender: AnyObject) {
        categoryTF.text = ""
        offerTF.text = ""
        typeTF.text = ""
        descriptionTF.text = ""
        addressTF.text = ""
        storeNameTF.text=""
        selectedIMG.image = nil
        
    }
    
    //This function is to diaplay alerts
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
    @IBOutlet weak var selectedIMG: UIImageView!        //selectedIMG is used to display the image which user selected
    
    //This action is performed when the user taps on the browse button
    @IBAction func uploadimageBTN(sender: AnyObject) {
        let myActionSheet = UIAlertController(title: "Select image", message: "Where would you like to  add image from?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        // choose from photos action button
        let chooseAction = UIAlertAction(title: "Choose from photos", style: UIAlertActionStyle.Default) { (action) in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            image.allowsEditing = false
            self.presentViewController(image, animated: true, completion: nil)
        }
        
        // take photo action button
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default) { (action) in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.Camera
            image.allowsEditing = false
            self.presentViewController(image, animated: true, completion: nil)
        }
        
        // cancel action button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) in
        }
        
        // add action buttons to action sheet
        myActionSheet.addAction(chooseAction)
        myActionSheet.addAction(takePhotoAction)
        myActionSheet.addAction(cancelAction)
        
        // support iPads (popover view)
        if let popoverController = myActionSheet.popoverPresentationController {
            popoverController.sourceView = sender as? UIView
            popoverController.sourceRect = sender.bounds
        }
        self.presentViewController(myActionSheet, animated: true, completion: nil)
        
        
        
    }
    
    //This function assigns the selected image to the selectedIMG outlet
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.selectedIMG.image = image
    }
    
    //This function assigns the date in sepecific format when user slects from date picker
    @IBAction func datePicker(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        endDate = dateFormatter.stringFromDate(datePicker.date)
        //let endClass=categoryTF.text
        print(endDate)
        
    }
    
    //This function creates the online class in back4app depending on the category selected
    func creatingClass(){
        let description1 = descriptionTF.text
        let address1 = addressTF.text
        let category1 = categoryTF.text
        let offer1 = offerTF.text
        let storename1=storeNameTF.text
        let posts = PFObject(className: category1!)
        posts["description"] = description1
        posts["address"] = address1
        posts["category"] = category1
        posts["offer"]=offer1
        posts["date"] = endDate
        posts["storeName"]=storename1
        posts["uploader"]=PFUser.currentUser()
        posts["username"]=PFUser.currentUser()?.username
        posts.saveInBackgroundWithBlock({
            (success: Bool, error: NSError?) -> Void in
            if error == nil {
                //success saving, Now save image.
                //create an image data
                let imageData = UIImagePNGRepresentation(self.selectedIMG!.image!)
                //create a parse file to store in cloud
                let parseImageFile = PFFile(name: "myImage.png", data: imageData!)
                posts["imageFile"] = parseImageFile
                // print(parseImageFile)
                posts.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        print("data uploaded")
                        
                    }else {
                        print(error)
                    }
                })
                
            }else {
                print(error)
                
            }
            
        })
        
    }
    
    //This function creates the in-store class in back4app depending on the category selected
    func creatingClassInstore(){
        let description1 = descriptionTF.text
        let address1 = addressTF.text
        var category1 = categoryTF.text
        let offer1 = offerTF.text
        let storename1=storeNameTF.text
        category1=category1!+"InStore"
        let postsInstore = PFObject(className: category1!)
        postsInstore["description"] = description1
        postsInstore["address"] = address1
        postsInstore["category"] = category1
        postsInstore["offer"]=offer1
        postsInstore["date"] = endDate
        postsInstore["storeName"]=storename1
        postsInstore["uploader"]=PFUser.currentUser()
        postsInstore["username"]=PFUser.currentUser()?.username
        print("hi")
        postsInstore.saveInBackgroundWithBlock({
            (success: Bool, error: NSError?) -> Void in
            
            if error == nil {
                /**success saving, Now save image.***/
                
                //create an image data
                let imageData = UIImagePNGRepresentation(self.selectedIMG!.image!)
                //create a parse file to store in cloud
                let parseImageFile = PFFile(name: "myImage.png", data: imageData!)
                
                postsInstore["imageFile"] = parseImageFile
                // print(parseImageFile)
                postsInstore.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        //take user home
                        
                        print("Test Success")
                        print("data uploaded")
                        
                        
                    }else {
                        
                        print(error)
                    }
                    
                    
                })
                
                
            } else {
                print(error)
            }
        })
    }
    
    var list = ["Books","Clothing","Electronics","Food","Furniture", "KitchenAppliances","Miscellaneous","Sports"]
    var type = ["Instore","Online"]
    var picker=UIPickerView()
    var picker1=UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker1.delegate = self
        picker1.dataSource = self
        
        
        picker = UIPickerView(frame: CGRectMake(0, 50, view.frame.width, 175))
        picker.backgroundColor = .whiteColor()
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        
        picker1 = UIPickerView(frame: CGRectMake(0, 50, view.frame.width, 175))
        picker1.backgroundColor = .whiteColor()
        
        picker1.showsSelectionIndicator = true
        picker1.delegate = self
        picker1.dataSource = self
        
        let TypeTFtoolBar = UIToolbar()
        TypeTFtoolBar.barStyle = UIBarStyle.Default
        TypeTFtoolBar.translucent = true
        TypeTFtoolBar.tintColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        TypeTFtoolBar.sizeToFit()
        
        let typeTFdoneButton1 = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(PostViewController.typeTFDonePicker))
        let typeTFspaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let typeTFcancelButton1 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(PostViewController.typeTFCancelPicker))
        
        TypeTFtoolBar.setItems([typeTFcancelButton1, typeTFspaceButton1, typeTFdoneButton1], animated: false)
        TypeTFtoolBar.userInteractionEnabled = true
        
        typeTF.inputView=picker1
        typeTF.inputAccessoryView=TypeTFtoolBar
        
        
        let categoryTFtoolBar = UIToolbar()
        categoryTFtoolBar.barStyle = UIBarStyle.Default
        categoryTFtoolBar.translucent = true
        categoryTFtoolBar.tintColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        categoryTFtoolBar.sizeToFit()
        
        let categoryTFdoneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(PostViewController.categoryTFDonePicker))
        let categoryTFspaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let categoryTFcancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(PostViewController.categoryTFCancelPicker))
        
        categoryTFtoolBar.setItems([categoryTFcancelButton, categoryTFspaceButton, categoryTFdoneButton], animated: false)
        categoryTFtoolBar.userInteractionEnabled = true
        
        categoryTF.inputView = picker
        categoryTF.inputAccessoryView = categoryTFtoolBar
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))        
        view.addGestureRecognizer(tap)
        
    }
    
    //This function is performed when user clicks on the categoryTFDonePicker done button on the picker view
    func categoryTFDonePicker() {
        categoryTF.resignFirstResponder()
    }
    
    //This function is performed when user clicks on the typeTFDonePicker done button on the picker view
    func typeTFDonePicker(){
        typeTF.resignFirstResponder()
    }
    
    //This function is performed when user clicks on the categoryTFDonePicker cancel button on the picker view
    func categoryTFCancelPicker() {
        categoryTF.resignFirstResponder()
        categoryTF.text=""
        
    }
    
    //This function is performed when user clicks on the typeTFCancelPicker cancel button on the picker view
    func typeTFCancelPicker(){
        typeTF.resignFirstResponder()
        typeTF.text=""
    }
    
    //This function returns the number of componets in the pickerview
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //This function returns the number of items in each components
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker{
            return list.count
        }
        else{
            return type.count
        }
    }
    
    //This function returns the selected row in the picker view
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker{
            categoryTF.text = list[row]
        }
        else{
            typeTF.text = type[row]
        }
    }
    
    //This function sets the title for picker view
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker{
            return list[row]
        }
        else{
            return type[row]
        }
    }
    
    //This function dismmisses keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //This function makes the view moves up when the textfields begin editing
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue:100)
    }
    
    // this Function executes when textfiels completes editing
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
