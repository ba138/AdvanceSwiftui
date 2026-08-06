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
    @State var timingRemaning : String = ""
    let futureDate : Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    func updateTimeRemainig (){
        let remaining = Calendar.current.dateComponents([.hour, .minute , .second], from: Date(), to: futureDate)
        let hourv = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timingRemaning = "\(hourv):\(minute):\(second)"
    }
    @State var circleCount : Int = 0
    var body: some View {
        ZStack{
            RadialGradient(
                colors: [Color.red,Color.green],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            HStack(spacing : 20 ){
                Circle()
                    .offset(y : circleCount == 1 ? -20 : 0)
                Circle()
                    .offset(y : circleCount == 2 ? -20 : 0)

                Circle()
                    .offset(y : circleCount == 3 ? -20 : 0)

            }
            .frame(width: 200)
            .foregroundColor(.white)
        
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)){
                circleCount = circleCount == 3 ? 0 : circleCount + 1

            }
        }
    }
}

#Preview {
    TimerBootCamp()
}
