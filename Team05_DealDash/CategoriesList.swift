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

class CategoriesList{
    var categories:[Category] =
        [Category(name:"Food", image:"food.jpeg",
            offersList:
            [Offers(item:"fruits", percentage:10, Address:"Walmart, Maryville", expDate: "10/31/2016"),
             Offers(item:"Dairy", percentage:5, Address:"Hyvee, Maryville", expDate: "10/25/2016")]),
         
         Category(name:"Clothing", image:"clothing.jpg",
            offersList:
            [Offers(item:"Business Formals", percentage:20, Address:"JC Penny, Maryville", expDate:"11/05/2016"),
            Offers(item:"jeans", percentage:10, Address:"JC Penny, Maryville", expDate:"11/10/2016")]),
         
        Category(name:"Electronics", image:"electronics.jpg",
            offersList:
            [Offers(item:"Smartphones", percentage:10, Address:"Walmart, Maryville", expDate: "11/01/2016"),
             Offers(item:"laptops", percentage:15, Address:"Walmart, Maryville", expDate: "11/05/2016")]),
        
        Category(name:"Books", image:"books.jpg",
            offersList:
            [Offers(item:"notebooks", percentage:15, Address:"Walmart, Marytville", expDate: "10/29/2016")]),
        
        Category(name:"Sports", image:"sports.jpg",
            offersList:
            [Offers(item:"sports balls", percentage:5, Address:"Walmart, maryville", expDate: "11/10/2016"),
             Offers(item:"rackets", percentage:15, Address:"Hyvee, maryville", expDate: "11/01/2016"),
             Offers(item:"footballgears", percentage:10, Address:"Walmart, maryville", expDate: "11/01/2016")]),
        
        Category(name:"Home & Furniture", image:"home .jpg",
            offersList:
            [Offers(item:"Sofa", percentage:25, Address:"Hyvee, Maryville", expDate: "10/25/2016"),
             Offers(item:"Dinning", percentage:15, Address:"Hyvee, Maryville", expDate: "11/05/2016")]),
        
        Category(name:"Kitchen Appliances", image:"kitchen.jpg",
            offersList:
            [Offers(item:"Kitchen wares", percentage:10, Address:"Walmart, Maryville", expDate: "11/05/2016"),
             Offers(item:"Toasters", percentage:5, Address:"Walmart, Maryville", expDate: "10/31/2016")]),
        ]
    
    
    func numCategories() -> Int {
        return categories.count
    }
    
    func categoryType(index:Int) -> Category{
        return categories[index]
    }
}