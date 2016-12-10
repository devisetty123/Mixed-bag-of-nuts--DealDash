//
//  OfferInfoViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/22/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//InStoreOfferInfoViewController class provides the information of a selected offer
class InStoreOfferInfoViewController: UIViewController {
    var offer:String!
    var address:String!
    var desc:String!
    var index:Int!
    var end:String!
    var img:UIImage!
    var link:String!
    var storename:String!
    
    @IBOutlet weak var imageIV: UIImageView!        //imageIV refers to image view in storyboard
    
    @IBOutlet weak var expDateTF: UITextField!      //expDateTF refers to expiry Date textfield in storyboard
    
    @IBOutlet weak var locationTF: UITextField!     //locationTF refers to location textfield in storyboard
    
    @IBOutlet weak var offerAmountLBL: UILabel!     //offerAmountLBL refers to offerAmount Label in storyboard
    
    @IBOutlet weak var storeNameTF: UITextField!    //storeNameTF refers to storeName textfield in storyboard
    
    @IBOutlet weak var itemTF: UITextField!         //itemTF refers to item textfield in storyboard
      var offerSelected:InStoreOffersTableViewController!
    
    //viewWillAppear loads everytime the view appears
    override func viewWillAppear(animated: Bool) {
        offerSelected = InStoreOffersTableViewController()
        self.navigationItem.title = offerSelected.category
        
        itemTF.text = desc
        imageIV.image = img
        offerAmountLBL.text = String(offer) + " offer on " + desc
        expDateTF.text = end
        locationTF.text = link
        storeNameTF.text=storename

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    //prepareForSegue directs to MapViewController when clicks on show on map button
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "mapview"
        {
            let address:MapViewController = segue.destinationViewController as! MapViewController
            
            //var locateHouse = address.location
            
            //locateHouse = houseNo.text
            //print(locateHouse)
            
            address.location = link
            print(address.location)
            
        }
    }

    
}
