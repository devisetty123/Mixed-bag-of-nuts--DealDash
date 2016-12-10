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

//Category class contains information of a category
class Category {
    var name:String     //name is a  stored property that stores the name of a category
    var image:String    //image is a stored [property that stores the image of a category

    //class initializer with name and image 
    init(name:String, image:String) {
        self.image = image
        self.name = name

    }
}