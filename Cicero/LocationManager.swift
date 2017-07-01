//
//  LocationManager.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import CoreLocation

class LocationManager: CLLocationManager {
    
    static let shared = LocationManager()
    
    private override init() {
        super.init()
        self.requestAlwaysAuthorization()
        self.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
}
