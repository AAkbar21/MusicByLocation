//
//  StateController.swift
//  MusicByLocation
//
//  Created by Akbar, Abdullah (RCH) on 04/03/2023.
//

import Foundation


class StateController: ObservableObject {
    let locationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    @Published var artistsByLocation: String = ""
  
    var lastKnownLocation : String = "" {
        didSet {
            iTunesAdaptor.getArtists(target: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?) {
        let names = artists?.map { return $0.name }
        DispatchQueue.main.async {
            self.artistsByLocation = names?.joined(separator: ", ") ?? "Error finding artists from your location"
        }
    }
}
