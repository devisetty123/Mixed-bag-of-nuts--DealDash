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

class OfferInfoViewController: UIViewController {
    
    var offer:Offers!
    
    @IBOutlet weak var imageIV: UIImageView!
    
    @IBOutlet weak var expDateLBL: UILabel!
    
    @IBOutlet weak var locationLBL: UILabel!
    
    @IBOutlet weak var expDateTF: UITextField!
    
    @IBOutlet weak var locationTF: UITextField!
    
    @IBOutlet weak var offerAmountLBL: UILabel!
    
    @IBOutlet weak var itemLBL: UILabel!
    
    @IBOutlet weak var itemTF: UITextField!
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = offer.item
        itemTF.text = String(offer.item)
        imageIV.image = UIImage(named:"\(offer.item).jpg")
        offerAmountLBL.text = String(offer.percentage) + " % offer on all " + String(offer.item)
        expDateTF.text = String(offer.expDate)
        locationTF.text = String(offer.Address)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
}
