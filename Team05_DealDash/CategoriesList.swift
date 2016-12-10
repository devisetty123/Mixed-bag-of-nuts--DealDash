//
//  CategoriesList.swift
//  Team05_DealDash
//
//  Created by Chidella,Sarath Kumar on 10/19/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts

//CategoriesList class which is a model that contains all the categories
class CategoriesList{
    var categories:[Category] =         //categories is an array of Cateogry type stores all categories
        [
          Category(name:"Books", image:"books.jpg"),
          Category(name:"Clothing", image:"clothing.jpg"),
          Category(name:"Electronics", image:"electronics.jpg"),
          Category(name:"Food", image:"food.jpeg"),
          Category(name:"Home & Furniture", image:"home .jpg"),
          Category(name:"Kitchen Appliances", image:"kitchen.jpg"),
          Category(name:"Miscellaneous", image:"Miscellaneous.jpg"),
          Category(name:"Sports", image:"sports.jpg"),
        ]
    
    //numCategories function returns number of categories present
    func numCategories() -> Int {
        return categories.count
    }
    
    //categoryType function returnthe particular categoryb at a given index
    func categoryType(index:Int) -> Category{
        return categories[index]
    }
}