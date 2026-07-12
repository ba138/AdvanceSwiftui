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
}
struct LocalNotificationBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Request Permission") {
                NotificationManger.instance.requestauth()
            }
        }
    }
}

#Preview {
    LocalNotificationBootCamp()
}
