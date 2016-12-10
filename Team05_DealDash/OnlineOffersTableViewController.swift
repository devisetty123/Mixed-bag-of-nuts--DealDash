//
//  OffersTableTableViewController.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha  on 10/25/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//InStoreOffersTableViewController class displays the list of offers available in a selected category
class OnlineOffersTableTableViewController:UITableViewController {
    
    var index:Int!
    @IBOutlet var myTable: UITableView!     //mytable refers to table view in the storyboard that displays list of offers
    var offers:[String]=[]
    var imageResources: [UIImage] = []
    var endDates:[String]=[]
    var webLink:[String]=[]
    var descriptions: [String]=[]
    var storeName:[String]=[]
    var category:String!
    var list = ["Books","Clothing","Electronics","Food","Furniture", "KitchenAppliances","Miscellaneous","Sports"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if index == 0{
            category="Books"
        }
        else if index == 1{
            category="Clothing"
        }
        else if index == 2{
            category="Electronics"
        }
        else if index == 3{
            category="Food"
        }
        else if index == 4{
            category="Furniture"
        }else if index == 5{
            category="KitchenAppliances"
        }
        else if index == 6{
            category="Miscellaneous"
        }
        else{
            category="Sports"
        }
        self.navigationItem.title = "Offers in "+category!
        retrevingList()
        myTable.reloadData()
        dispatch_async(dispatch_get_main_queue()){
            self.tableView.reloadData()
            NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //retrevingList function retrives list of offers from the database
    func retrevingList(){
        let query = PFQuery(className: category!)
        query.findObjectsInBackgroundWithBlock { (objects, error) in
            if error == nil{
                
                if let returnedobjects = objects{
                    for object in returnedobjects{
                        
                        let thumbNail = object["imageFile"] as! PFFile
                        thumbNail.getDataInBackgroundWithBlock({
                            (imageData, error) -> Void in
                            
                            if (error == nil) {
                                let offerstr=(object["offer"] as! String)
                                self.offers.append(offerstr)
                                
                                let image = UIImage(data:imageData!)
                                self.imageResources.append(image!)
                                
                                let desc = (object["description"] as! String)
                                self.descriptions.append(desc)
                                
                                let end = (object["date"] as! String)
                                self.endDates.append(end)
                                
                                let website = (object["address"] as! String)
                                self.webLink.append(website)
                                
                                let stores=(object["storeName"] as! String)
                                self.storeName.append(stores)
                                
                                dispatch_async(dispatch_get_main_queue()){
                                    self.myTable.reloadData()
                                    NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
                                }
                                
                            }
                            
                        })
                        
                    }
                    
                }
                
                
            } else {
                print("An error has occurred in retrievingDescription(): \(error)")
            }
            
        }
        
    }
    
    //This function returns number of sections in a tableview
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //This function returns number of rows present in a section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    //This function places the data into table cell for selected section and row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("offers", forIndexPath: indexPath)
        let offerAmount:UILabel = cell.viewWithTag(101) as! UILabel
        let image:UIImageView = cell.viewWithTag(100) as! UIImageView
        
        offerAmount.text = String(offers[indexPath.row] + " offer on " + descriptions[indexPath.row])
        image.image = imageResources[indexPath.row]
        
        return cell
    }
    
    //prepareForSegue function directs to OnlineOffersInfoViewController class when a particular offer is selected
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let offerTVC:OnlineOffersInfoViewController = segue.destinationViewController as! OnlineOffersInfoViewController
        offerTVC.index = ((myTable.indexPathForSelectedRow?.row)!)
        offerTVC.end = endDates[offerTVC.index]
        print(webLink)
        offerTVC.link=webLink[offerTVC.index]
        offerTVC.offer=offers[offerTVC.index]
        offerTVC.img=imageResources[offerTVC.index]
        offerTVC.storename=storeName[offerTVC.index]
        offerTVC.desc=descriptions[offerTVC.index]
        
    }
    
}
