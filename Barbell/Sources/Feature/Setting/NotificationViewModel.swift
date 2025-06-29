//
//  SettingViewModel.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import Foundation
import UserNotifications

final class NotificationViewModel: ObservableObject {
    @Published var isToggle: Bool = UserDefaults.standard.bool(forKey: "notificationIsToggle") {
        didSet {
            UserDefaults.standard.set(isToggle, forKey: "notificationIsToggle")
            saveNotificationSetting()
        }
    }
    
    @Published var selectedTime: Date = UserDefaults.standard.object(forKey: "notificationSelectedTime") as? Date ?? Date() {
        didSet {
            UserDefaults.standard.set(selectedTime, forKey: "notificationSelectedTime")
            if isToggle {
                saveNotificationSetting()
            }
        }
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: selectedTime)
    }
    
    func saveNotificationSetting() {
        if isToggle {
            requestPermissionAndSchedule()
        } else {
            cancelNotifications()
        }
    }
    
    //MARK: 알림 허가 확인 함수
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
