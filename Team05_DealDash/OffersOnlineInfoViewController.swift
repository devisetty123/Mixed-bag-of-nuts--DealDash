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

class OffersOnlineInfoViewController: UIViewController {

    @IBOutlet weak var imageIV: UIImageView!
   var offer:Offers!

    @IBOutlet weak var itemTypeTF: UITextField!
    @IBOutlet weak var offerAmountLBL: UILabel!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var expDateTF: UITextField!
    @IBOutlet weak var locationLBL: UILabel!
    @IBOutlet weak var expDateLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

           }
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = offer.item
        itemTypeTF.text = String(offer.item)
        imageIV.image = UIImage(named:"\(offer.item).jpg")
        offerAmountLBL.text = String(offer.percentage) + " % offer on all " + String(offer.item)
        expDateTF.text = String(offer.expDate)
        locationTF.text = String(offer.websiteName)
    }
    

      
    @IBAction func goToWebsiteBTN(sender: AnyObject) {
        if let url = NSURL(string: offer.website) {
            UIApplication.sharedApplication().openURL(url)
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

   }
