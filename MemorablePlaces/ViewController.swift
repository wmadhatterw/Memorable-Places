//
//  ViewController.swift
//  MemorablePlaces
//
//  Created by Seth Walton on 8/27/18.
//  Copyright © 2018 Seth Walton. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if activePlace != -1 {
            // get place details to display on map
            
            if places.count > activePlace{
                
                if let name = places[activePlace]["name"]{
                    
                    if let lat = places[activePlace]["lat"]{
                        
                        if let lon = places[activePlace]["lon"]{
                            
                            if let latitude = Double(lat){
                                
                                if let longitude = Double(lon){
                                    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                }
                                
                            }
                            
                        }
                    }
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

