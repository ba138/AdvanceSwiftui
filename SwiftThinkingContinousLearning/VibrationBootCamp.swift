//
//  VibrationBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 11/07/2026.
//

import SwiftUI
import UIKit

class Heptics{
    static let instance = Heptics() // singleton
    func notification(type : UINotificationFeedbackGenerator.FeedbackType)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
    func selectionChanged() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
}

struct VibrationBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Haptics Demo")
                .font(.title)

            Button("Success Notification") {
                Heptics.instance.notification(type: .success)
            }
            Button("Warning Notification") {
                Heptics.instance.notification(type: .warning)
            }
            Button("Error Notification") {
                Heptics.instance.notification(type: .error)
            }

            Divider()

            Button("Impact Light") {
                Heptics.instance.impact(style: .light)
            }
            Button("Impact Medium") {
                Heptics.instance.impact(style: .medium)
            }
            Button("Impact Heavy") {
                Heptics.instance.impact(style: .heavy)
            }
            if #available(iOS 13.0, *) {
                Button("Impact Soft") {
                    Heptics.instance.impact(style: .soft)
                }
                Button("Impact Rigid") {
                    Heptics.instance.impact(style: .rigid)
                }
            }

            Divider()

            Button("Selection Changed") {
                Heptics.instance.selectionChanged()
            }
        }
        .padding()
    }
}

#Preview {
    VibrationBootCamp()
}
