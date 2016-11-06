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

class OffersOnlineTableTableViewController: UITableViewController {
    var offerList:Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Offers in " + offerList.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
     
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return offerList.numOffers()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("offers", forIndexPath: indexPath)
        let offerAmount:UILabel = cell.viewWithTag(101) as! UILabel
        let image:UIImageView = cell.viewWithTag(100) as! UIImageView
        
        offerAmount.text = String(offerList.offersNum(indexPath.row).percentage) + "% offer on all " + String(offerList.offersNum(indexPath.row).item)
        image.image = UIImage(named: "\(offerList.offersNum(indexPath.row).item).jpg")
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let offerTVC:OffersOnlineInfoViewController = segue.destinationViewController as! OffersOnlineInfoViewController
        offerTVC.offer = offerList.offersNum((tableView.indexPathForSelectedRow?.row)!)
    }
    
    
    
}
