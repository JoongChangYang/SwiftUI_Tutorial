//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by YJC on 2022/10/05.
//

import WatchKit
import SwiftUI
import UserNotifications

final class NotificationController: WKUserNotificationHostingController<NotificationView> {
    private var landmark: Landmark?
    private var title: String?
    private var message: String?
    
    private let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        return NotificationView(title: self.title,
                                message: self.message,
                                landmark: self.landmark)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let notificationData = notification.request.content.userInfo as? [String: Any]
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        self.title = alert?["title"] as? String
        self.message = alert?["body"] as? String
        
        if let index = notificationData?[self.landmarkIndexKey] as? Int {
            self.landmark = LocalStorageService.landmarks[index]
        }
    }
}
