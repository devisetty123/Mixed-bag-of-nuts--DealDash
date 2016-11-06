//
//  Category.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha on 10/6/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts

class Category {
    var name:String
    var image:String
    var offersList:[Offers]
    
    init(name:String, image:String, offersList:[Offers]) {
        self.image = image
        self.name = name
        self.offersList = offersList
    }
    
    func numOffers() -> Int{
        return offersList.count
    }
    
    func offersNum(index:Int) -> Offers {
        return offersList[index]
    }
}