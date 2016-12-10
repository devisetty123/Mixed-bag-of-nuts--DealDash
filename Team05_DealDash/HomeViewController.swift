//
//  FirstViewController.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/6/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

//HomeViewController have the details of home page of application
class HomeViewController: UIViewController {
    
   @IBOutlet weak var selectLBL: UILabel!               //selectLBL refers to select an option label in storyboard
    
    
    @IBAction func inStoreBTN(sender: AnyObject) {      //instoreBTN refers to inStore offers button in storyboard
    }
    

    @IBAction func onlineBTN(sender: AnyObject) {       //onlineBTN refers to online offers button in storyboard
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

