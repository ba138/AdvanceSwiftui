//
//  TimerBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 06/08/2026.
//

import SwiftUI

struct TimerBootCamp: View {
    var body: some View {
        ZStack{
            RadialGradient(
                colors: [Color.red,Color.green],
                center: .center,
                startRadius: 5,
                endRadius: 500)
        }.ignoresSafeArea()
    }
}

#Preview {
    TimerBootCamp()
}
