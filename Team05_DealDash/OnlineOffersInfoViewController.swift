//
//  OffersOnlineInfoViewController.swift
//  Team05_DealDash
//
//  Created by SriHarsha Devisetty on 10/26/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//OnlineOfferInfoViewController class provides the information of a selected offer
class OnlineOffersInfoViewController: UIViewController {
    
    @IBOutlet weak var imageIV: UIImageView!        //imageIV refers to image view in storyboard
    var index:Int!
    var end:String!
    var offer:String!
    var link:String!
    var desc:String!
    var img:UIImage!
    var storename:String!
    @IBOutlet weak var itemTypeTF: UITextField!     //itemTypeTF refers to item textfield in storyboard
    @IBOutlet weak var offerAmountLBL: UILabel!     //offerAmountLBL refers to offerAmount Label in storyboard
    @IBOutlet weak var locationTF: UITextField!     //locationTF refers to location textfield in storyboard
    @IBOutlet weak var expDateTF: UITextField!      //expDateTF refers to expiry Date textfield in storyboard
    var offerSelected:OnlineOffersTableTableViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    //viewWillAppear loads everytime the view appears
    override func viewWillAppear(animated: Bool) {
        offerSelected=OnlineOffersTableTableViewController()
        self.navigationItem.title = offerSelected.category
        
        itemTypeTF.text = desc
        imageIV.image = img
        offerAmountLBL.text = String(offer) + " offer on " + desc
        expDateTF.text = end
        locationTF.text = storename
    }
    
    //goToWebsiteBTN function directs directly to website link provided
    @IBAction func goToWebsiteBTN(sender: AnyObject) {
        if let url = NSURL(string: link) {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
        
}
