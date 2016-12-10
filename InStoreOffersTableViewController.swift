//
//  OffersTableTableViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/19/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//InStoreOffersTableViewController class displays the list of offers available in a selected category
class InStoreOffersTableViewController: UITableViewController {
    
    var offers:[String]=[]
    var index:Int!
    var imageResources: [UIImage] = []
    var endDates:[String]=[]
    var webLink:[String]=[]
    var descriptions: [String]=[]
    var storeName:[String]=[]
    @IBOutlet var myTable: UITableView!     //mytable refers to table view in the storyboard that displays list of offers
    var category:String!
    var list = ["Books","Clothing","Electronics","Food","Furniture", "KitchenAppliances","Miscellaneous","Sports"]
    var indicator = UIActivityIndicatorView()
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 40, 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if index == 0{
            category="BooksInStore"
        }
        else if index == 1{
            category="ClothingInStore"
        }
        else if index == 2{
            category="ElectronicsInStore"
        }
        else if index == 3{
            category="FoodInStore"
        }
        else if index == 4{
            category="FurnitureInStore"
        }else if index == 5{
            category="KitchenAppliancesInStore"
        }
        else if index == 6{
            category="MiscellaneousInStore"
        }
        else{
            category="SportsInStore"
        }
        self.navigationItem.title = "Offers in "+list[index]
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
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.whiteColor()
        let query = PFQuery(className: category!)
        query.findObjectsInBackgroundWithBlock { (objects, error) in
            if error == nil{
                if let returnedobjects = objects{
                    for object in returnedobjects{
                        let thumbNail = object["imageFile"] as! PFFile
                        thumbNail.getDataInBackgroundWithBlock({
                            (imageData, error) -> Void in
                            
                            if (error == nil) {
                                let offer=(object["offer"] as! String)
                                self.offers.append(offer)
                                
                                let image = UIImage(data:imageData!)
                                self.imageResources.append(image!)
                                
                                let description = (object["description"] as! String)
                                self.descriptions.append(description)
                                
                                let endDate = (object["date"] as! String)
                                self.endDates.append(endDate)
                                
                                let website = (object["address"] as! String)
                                self.webLink.append(website)
                                
                                let store=(object["storeName"] as! String)
                                self.storeName.append(store)
                                
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
        print("from img:\(imageResources[indexPath.row])")
        print("In table view")
        image.image = imageResources[indexPath.row]
        
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        return cell
    }
    
    //prepareForSegue function directs to InStoreOfferInfoViewController class when a particular offer is selected
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let offerTVC:InStoreOfferInfoViewController = segue.destinationViewController as! InStoreOfferInfoViewController
        
        offerTVC.index = ((tableView.indexPathForSelectedRow?.row)!)
        offerTVC.address=webLink[offerTVC.index]
        offerTVC.offer=offers[offerTVC.index]
        offerTVC.img=imageResources[offerTVC.index]
        offerTVC.desc=descriptions[offerTVC.index]
        offerTVC.end = endDates[offerTVC.index]
        offerTVC.storename=storeName[offerTVC.index]
        offerTVC.link=webLink[offerTVC.index]
        
    }
    
}
