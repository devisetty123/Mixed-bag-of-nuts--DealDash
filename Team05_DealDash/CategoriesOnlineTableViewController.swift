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

class CategoriesOnlineTableViewController: UITableViewController {
    
    let category = CategoriesOnline()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
   
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return category.numCategories()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categories", forIndexPath: indexPath)
        
        let categoryImage:UIImageView = cell.viewWithTag(100) as! UIImageView
        let categoryName:UILabel = cell.viewWithTag(101) as! UILabel
        
        categoryName.text = category.categoryType(indexPath.row).name
        categoryImage.image = UIImage(named: "\(category.categoryType(indexPath.row).image)")
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let offersTVC:OffersOnlineTableTableViewController = segue.destinationViewController as! OffersOnlineTableTableViewController
        offersTVC.offerList = category.categoryType((tableView.indexPathForSelectedRow?.row)!)
    }
   }
