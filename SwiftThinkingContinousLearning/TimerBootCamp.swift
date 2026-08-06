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
        formater.timeStyle = .medium
        return formater
    }
    var body: some View {
        ZStack{
            RadialGradient(
                colors: [Color.red,Color.green],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            Text(dateFormater.string(from: currentDate))
                .font(.system(size: 60,weight: .semibold,design: .rounded)
                )
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { value in
            currentDate = value
        }
    }
}

#Preview {
    TimerBootCamp()
}
