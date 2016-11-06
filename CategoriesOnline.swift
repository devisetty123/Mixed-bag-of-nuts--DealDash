//
//  CategoriesList.swift
//  Team05_DealDash
//
//  Created by Devisetty,Sri Harsha on 10/26/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts

class CategoriesOnline{
    var categories:[Category] =
        [Category(name:"Food", image:"food.jpeg",
            offersList:
            [Offers(item:"fruits", percentage:10,websiteName:"Walmart", website:"Walmart, Maryville", expDate: "10/31/2016"),
                Offers(item:"Dairy", percentage:5,websiteName:"Hyvee", website:"https://www.hy-vee.com", expDate: "10/25/2016")]),
         
         Category(name:"Clothing", image:"clothing.jpg",
            offersList:
            [Offers(item:"Business Formals", percentage:20, websiteName:"JCPenny",website:"https://www.jcpenny.com", expDate:"11/05/2016"),
                Offers(item:"jeans", percentage:10,websiteName:"JCPenny", website:"https://www.jcpenny.com", expDate:"11/10/2016")]),
         
         Category(name:"Electronics", image:"electronics.jpg",
            offersList:
            [Offers(item:"Smartphones", percentage:10,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "11/01/2016"),
                Offers(item:"laptops", percentage:15,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "11/05/2016")]),
         
         Category(name:"Books", image:"books.jpg",
            offersList:
            [Offers(item:"notebooks", percentage:15,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "10/29/2016")]),
         
         Category(name:"Sports", image:"sports.jpg",
            offersList:
            [Offers(item:"sports balls", percentage:5,websiteName:"Walmart", website:"Walmart, maryville", expDate: "11/10/2016"),
                Offers(item:"rackets", percentage:15,websiteName:"Hyvee", website:"https://www.hy-vee.com", expDate: "11/01/2016"),
                Offers(item:"footballgears", percentage:10,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "11/01/2016")]),
         
         Category(name:"Home & Furniture", image:"home .jpg",
            offersList:
            [Offers(item:"Sofa", percentage:25,websiteName:"Hyvee", website:"https://www.hy-vee.com", expDate: "10/25/2016"),
                Offers(item:"Dinning", percentage:15, websiteName:"Hyvee",website:"https://www.hy-vee.com", expDate: "11/05/2016")]),
         
         Category(name:"Kitchen Appliances", image:"kitchen.jpg",
            offersList:
            [Offers(item:"Kitchen wares", percentage:10,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "11/05/2016"),
                Offers(item:"Toasters", percentage:5,websiteName:"Walmart", website:"https://www.walmart.com", expDate: "10/31/2016")]),
         ]
    
    
    func numCategories() -> Int {
        return categories.count
    }
    
    func categoryType(index:Int) -> Category{
        return categories[index]
    }
}