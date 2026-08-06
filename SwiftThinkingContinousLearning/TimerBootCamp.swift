//
//  TimerBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 06/08/2026.
//

import SwiftUI
import Combine

struct TimerBootCamp: View {
    let timer = Timer.publish(every: 1.0, on: .main , in: .common).autoconnect()
    @State var currentDate : Date = Date()
    var dateFormater : DateFormatter{
        let formater = DateFormatter()
        formater.dateStyle = .medium

        formater.timeStyle = .medium
        return formater
    }
    @State var count : Int = 10
    @State var finishedText : String? = nil
    var body: some View {
        ZStack{
            RadialGradient(
                colors: [Color.red,Color.green],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            Text(finishedText ?? "\(count)")
                .font(.system(size: 60,weight: .semibold,design: .rounded)
                )
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { _ in
            if count < 1 {
                finishedText = "Wow"
            }else {
                count -= 1
            }
        }
    }
}

#Preview {
    TimerBootCamp()
}
