//
//  AppDelegate.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

enum NotificationName: String {
    case Museum = "museum"
    case Garden = "garden"
    case Art = "art"
}

enum RegionIdentifier: String {
    case Museum = "museum"
    case Garden = "garden"
    case Art = "art"
}

let beaconUUID = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {

    var window: UIWindow?

    let locationManager = CLLocationManager()
    
    let gardenRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 37447, minor: 29234, identifier: RegionIdentifier.Garden.rawValue)
    
    let museumRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 54280, minor: 36780, identifier: RegionIdentifier.Museum.rawValue)
    
    let artRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, major: 41868, minor: 24244, identifier: RegionIdentifier.Art.rawValue)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
            if !accepted {
                print("Notification access denied.")
            }
        }
        
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoring(for: gardenRegion)
        locationManager.startMonitoring(for: museumRegion)
        locationManager.startMonitoring(for: artRegion)
        locationManager.delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("you entered \(region)")
        var title: String
        var body: String
        var identifier: String
        
        switch region.identifier {
        case RegionIdentifier.Garden.rawValue:
            title = "Welcome to Capodimonte!"
            body = "Click on the notification to start your tour"
            identifier = "gardenNotification"
        case RegionIdentifier.Museum.rawValue:
            title = "You have entered the museum"
            body = "Listen to the instructions about navigation"
            identifier = "museumNotification"
        case RegionIdentifier.Art.rawValue:
            title = "Art Name"
            body = "Listen to the information"
            identifier = "artNotification"
        default:
            return
        }
        UserNotificationHelper.shared.createNotification(title: title, body: body, identifier: identifier)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("you exited \(region)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main")
        
        self.window?.rootViewController = vc
        
        completionHandler()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

