//
//  UserNotificationHelper.swift
//  Cicero
//
//  Created by Onder Erguven on 01/07/2017.
//  Copyright © 2017 taralli. All rights reserved.
//

import UserNotifications


class UserNotificationHelper {
    
    enum NotificationName: String {
        case Museum = "museum"
        case Garden = "garden"
        case Art = "art"
    }
    
    static let shared = UserNotificationHelper()
    
    private init() {}
    
    func createNotification(title: String, body: String, identifier: String) {
        let notification = Notification(name: Notification.Name(NotificationName.Museum.rawValue))
        NotificationCenter.default.post(notification)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
}
