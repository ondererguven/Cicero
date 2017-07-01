//
//  BeaconManager.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import CoreLocation

enum RegionIdentifier: String {
    case Apartment = "apartment"
    case Garden = "garden"
    case Armory = "armory"
}

let beaconUUID = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"

class BeaconManager {
    
    static let shared = BeaconManager()
    
    private var gardenRegion: CLBeaconRegion
    private var apartmentRegion: CLBeaconRegion
    private var armoryRegion: CLBeaconRegion
    
    private init() {
        gardenRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 37447, minor: 29234, identifier: RegionIdentifier.Garden.rawValue)
        
        apartmentRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 54280, minor: 36780, identifier: RegionIdentifier.Apartment.rawValue)
        
        armoryRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 41868, minor: 24244, identifier: RegionIdentifier.Armory.rawValue)
    }
    
    func getRegions() -> [CLBeaconRegion] {
        return [gardenRegion, apartmentRegion, armoryRegion]
    }
}
