//
//  NotificationDelegate.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//


import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
      completionHandler([.badge, .banner, .sound])
  }
}
