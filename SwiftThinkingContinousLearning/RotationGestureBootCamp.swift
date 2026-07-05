//
//  RotationGestureBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 05/07/2026.
//

import SwiftUI

struct RotationGestureBootCamp: View {
    @State var angle : Angle = Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .font(.title)
            .padding(40)
            .background(.green)
            .rotationEffect(angle)
            .cornerRadius(12)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                      angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring()){
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootCamp()
}
