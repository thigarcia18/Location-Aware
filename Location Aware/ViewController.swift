//
//  ViewController.swift
//  Location Aware
//
//  Created by Thiago Garcia on 13/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    var locationManager = CLLocationManager()
    
    @IBOutlet var lblSpe: UILabel!
    @IBOutlet var lblLati: UILabel!
    @IBOutlet var lblLong: UILabel!
    @IBOutlet var lblCourse: UILabel!
    @IBOutlet var lblAlt: UILabel!
    @IBOutlet var lblAddr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        lblLati.text = String(userLocation.coordinate.latitude)
        
        lblLong.text = String(userLocation.coordinate.longitude)
        
        lblCourse.text = String(userLocation.course)
        
        lblSpe.text = String(userLocation.speed)
        
        lblAlt.text =  String(userLocation.altitude)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) {
            (placemarks, error) in
            
            if error != nil {
                
                print(error!)
                
            } else {
                
                if let placemark = placemarks?[0] {
                    
                    var subThoroughfare = ""
                    
                    if placemark.subThoroughfare != nil {
                        
                        subThoroughfare = placemark.subThoroughfare!
                        
                    }
                    
                    var thoroughFare = ""
                    
                    if placemark.thoroughfare != nil {
                        
                        thoroughFare = placemark.thoroughfare!
                        
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil {
                        
                        subLocality = placemark.subLocality!
                        
                    }
                    
                    var subAdminArea = ""
                    
                    if placemark.subAdministrativeArea != nil {
                        
                        subAdminArea = placemark.subAdministrativeArea!
                        
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil {
                        
                        postalCode = placemark.postalCode!
                        
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil {
                        
                        country = placemark.country!
                        
                    }
                    
                    self.lblAddr.text = subThoroughfare + " " + thoroughFare + "\n" + subLocality + "\n" + subAdminArea + "\n" + postalCode + "\n" + country
                    
                }
                
            }
            
        }
        
    }
    

}

