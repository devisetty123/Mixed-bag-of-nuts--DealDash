//
//  CategoriesTableViewController.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha on 10/6/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//OnlineCategoriesTableViewController class dis[plays all the categories available
class OnlineCategoriesTableViewController: UITableViewController {
    
    let category = CategoriesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //This function returns number of sections present in tableview
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //This function returns number of rows present in a selected section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.numCategories()
    }
    
    //This function provides the information into the table cell for selected section and row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categories", forIndexPath: indexPath)
        let categoryImage:UIImageView = cell.viewWithTag(100) as! UIImageView
        let categoryName:UILabel = cell.viewWithTag(101) as! UILabel
        
        categoryName.text = category.categoryType(indexPath.row).name
        categoryImage.image = UIImage(named: "\(category.categoryType(indexPath.row).image)")
        return cell
    }
    
    //prepareForSegue function directs to OnlineOffersTableViewController when clicks on a category
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let offersTVC:OnlineOffersTableTableViewController = segue.destinationViewController as! OnlineOffersTableTableViewController
        offersTVC.index = ((tableView.indexPathForSelectedRow?.row)!)
    }
}
