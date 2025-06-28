//
//  AppDelegate.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//


import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  var notifDelegate = NotificationDelegate()
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = notifDelegate
    return true
  }
}