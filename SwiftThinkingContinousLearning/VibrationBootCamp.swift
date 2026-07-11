//
//  VibrationBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 11/07/2026.
//

import SwiftUI
class Heptics{
    static let instance = Heptics() // singleton
    func notification(type : UINotificationFeedbackGenerator.FeedbackType)
    {
      let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact()
    {
        
    }
}
struct VibrationBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    VibrationBootCamp()
}
