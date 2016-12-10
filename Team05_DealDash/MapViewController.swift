//
//  MapViewController.swift
//  Team05_DealDash
//
//  Created by SriHarsha Devisetty on 11/30/16.
//  Copyright © 2016 Chidella,Sarath Kumar. All rights reserved.
//

import UIKit
import MapKit

//MapViewController class provides location of the store
class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!      //map refers to map view in storyboard
    
    var location:String!
    var locate:String!
    let geocoder = CLGeocoder()
    var loc:String!
    var street:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()       
    }
    
    //viewWillAppear function calls everytime the view appears
    override func viewWillAppear(animated: Bool)
    {
        loc = location
        forwardGeocoding("\(loc)")
    }
    
    //forwardGeocoding class converts the address to map coordinates and displays location on map
    func forwardGeocoding(address: String)
    {
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil
            {
                print(error)
                return
            }
            let placemark = placemarks?[0]
            let location = placemark?.location
            let coordinate = location?.coordinate
            print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
            
            let addrss:[String] = address.componentsSeparatedByString(",")
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
            annotation.title = addrss[0]
            annotation.subtitle = addrss[1]
            
            self.map.addAnnotation(annotation)
            self.map.showAnnotations(self.map.annotations, animated: true)
            }
        )
    }
    
    
}
