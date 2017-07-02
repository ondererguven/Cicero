//
//  LocationManager.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import NotificationCenter
import CoreLocation

class LocationManager: CLLocationManager {
    
    static let shared = LocationManager()
    
    // context to load the current position
    var collectionAtCurrentLocation: CollectionType!
    var currentArtPieceIndex: Int!
    
    private override init() {
        super.init()
        self.requestAlwaysAuthorization()
        self.desiredAccuracy = kCLLocationAccuracyBest
        //Default Value to garden section
        self.collectionAtCurrentLocation = .appartamentiReali
        //Default Value to second cell
        self.currentArtPieceIndex = 1
    }
    
    func setNewLocation() {
        let locationChangedNotification = Notification(name: Notification.Name(rawValue: "locationChanged"), object: nil, userInfo: ["location": collectionAtCurrentLocation])
        NotificationCenter.default.post(locationChangedNotification)
    }
}
