//
//  MyPostsTableViewController.swift
//  Team05_DealDash
//
//  Created by SriHarsha Devisetty on 12/2/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse

//MyPostsTableViewController
class MyPostsTableViewController: UITableViewController {
    
    var address:[String] = []
    var offers:[String] = []
    var imageResources:[UIImage] = []
    var descriptions: [String] = []
    var objectID:[String]=[]
    let categories=["Books","BooksInStore","Clothing","ClothingInStore","Electronics","ElectronicsInStore","Sports","SportsInStore","Food","FoodInStore","Furniture","FurnitureInStore","KitchenAppliances","KitchenAppliancesInStore"]
    override func viewDidLoad() {
        super.viewDidLoad()
        retrevingList()
        
    }
    
    //This function is used to retrive the posts of the current user who logged in
    func retrevingList(){
        for category in categories{
            let query = PFQuery(className: "\(category)")
            query.findObjectsInBackgroundWithBlock { (objects, error) in
                if error == nil{
                    
                    if let returnedobjects = objects {
                        for object in returnedobjects {
                            if object["username"] as? String == PFUser.currentUser()?.username{
                                let thumbNail = object["imageFile"] as! PFFile
                                thumbNail.getDataInBackgroundWithBlock({
                                    (imageData, error) -> Void in
                                    if (error == nil) {
                                        let offers=(object["offer"] as! String)
                                        self.offers.append(offers)
                                        self.objectID.append(object.objectId! as String)
                                        let image = UIImage(data:imageData!)
                                        
                                        self.imageResources.append(image!)
                                        let descriptions = (object["description"] as! String)
                                        self.descriptions.append(descriptions)
                                        dispatch_async(dispatch_get_main_queue()){
                                            self.tableView.reloadData()
                                            NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)                                         }
                                    }
                                })
                            }
                        }
                    }
                } else {
                    print("An error has occurred in retrievingDescription(): \(error)")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //This function returns the number of section in the table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //This function returns the number of rows in each section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    //This funtion sets the data for each row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myposts", forIndexPath: indexPath)
        let offerAmount:UILabel = cell.viewWithTag(101) as! UILabel
        let image:UIImageView = cell.viewWithTag(100) as! UIImageView
        if descriptions.count != 0{
            offerAmount.text=String(offers[indexPath.row]+" offer on " + descriptions[indexPath.row])
            image.image = imageResources[indexPath.row]
        }
        return cell
    }
    
    //This function is clled when the user wants to delete his posts
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            self.offers.removeAtIndex(indexPath.row)
            self.descriptions.removeAtIndex(indexPath.row)
            self.imageResources.removeAtIndex(indexPath.row)
            for category in categories{
                let query = PFQuery(className: "\(category)")
                query.whereKey("objectId", equalTo: "\(objectID[indexPath.row])")
                query.findObjectsInBackgroundWithBlock {
                    (objects, error) -> Void in
                    for object in objects! {
                        object.deleteEventually()
                        
                    }
                }
            }
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    //This function is to display alerts
    func displayMessage(message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
}
