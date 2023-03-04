//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Akbar, Abdullah (RCH) on 04/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    @Published var lastKnownLocation: String = " "
    
    override init() {
        super.init()
        manager.delegate =  self
    }
 
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinates = locations.first?.coordinate {
            lastKnownLocation = "\(coordinates.latitude)"
        } else {
            lastKnownLocation = "No valid Location found"
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnownLocation = "Error Finding Location"
    }

}
