//
//  File.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/19/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts

class Offers {
    var item: String
    var percentage: Int
    var Address: String=""
    var expDate: String
    var website:String=""
    var websiteName:String=""
    
    init(item:String, percentage:Int, Address:String, expDate:String){
        self.item = item
        self.percentage = percentage
        self.Address = Address
        self.expDate = expDate
    }
    init(item:String, percentage:Int,websiteName:String ,website:String, expDate:String){
        self.item = item
        self.percentage = percentage
        self.websiteName=websiteName
        self.website = website
        self.expDate = expDate
    }
}