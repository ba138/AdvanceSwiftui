//
//  LocalNotificationBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 12/07/2026.
//

import SwiftUI
import UserNotifications
class NotificationManger{
    static let instance = NotificationManger()
    func requestauth(){
        let option : UNAuthorizationOptions = [
            .alert,.sound,.badge
        ]
        UNUserNotificationCenter.current().requestAuthorization(options: option){(success,error) in
            if let error = error {
                print("Error : \(error)")
            }else{
                print("success : \(success)")
            }
        }
    }
    func schedualNotification(){
        let content = UNMutableNotificationContent()
        content.title = "This is my first notificatio"
        content.subtitle = "This was too easy for me"
        content.sound = .default
        content.badge = 1
        //we have three triggerd
        
        //Time
//        let time = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //Calander
        var dateComponent = DateComponents()
        dateComponent.hour = 12;        dateComponent.minute = 54
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        //Locstion
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
struct LocalNotificationBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Request Permission") {
                NotificationManger.instance.requestauth()
            }
            Button("send Notification") {
                NotificationManger.instance.schedualNotification()
            }
        }
        .onAppear(){
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    LocalNotificationBootCamp()
}
