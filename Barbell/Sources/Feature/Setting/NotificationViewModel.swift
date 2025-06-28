//
//  SettingViewModel.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import Foundation
import UserNotifications

final class NotificationViewModel: ObservableObject {
    @Published var isToggle: Bool = false
    @Published var selectedTime: Date = Date()
    
    func saveNotificationSetting() {
        if isToggle {
            requestPermissionAndSchedule()
        } else {
            cancelNotifications()
        }
    }
    
    private func requestPermissionAndSchedule() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    self.scheduleNotification()
                } else {
                    self.isToggle = false
                }
            }
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "운동할 시간이에요!"
        content.body = "오늘도 힘차게 운동 시작해볼까요?"
        content.sound = .default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "userNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("알림 예약 실패: \(error.localizedDescription)")
            } else {
                print("알림 예약 성공")
            }
        }
    }
    
    private func cancelNotifications() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["userNotification"])
        print("알림 취소 완료")
    }
}
