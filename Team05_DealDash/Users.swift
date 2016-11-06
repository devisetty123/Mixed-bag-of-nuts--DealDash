//
//  Users.swift
//  Team05_DealDash
//
//  Created by SriHarsha Devisetty on 11/5/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//


import Foundation
import Parse
import Bolts

class Users: PFObject, PFSubclassing {
    @NSManaged var firstName:String!
    @NSManaged var lastName:String!
    @NSManaged var eMail:String!
    
    static func parseClassName() -> String {
        return "Users"
    }
    
}