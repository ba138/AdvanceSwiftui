//
//  MagnificationFGestureBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 04/07/2026.
//

import SwiftUI

struct MagnificationFGestureBootCamp: View {
    @State var gestureValve : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .padding(40)
            .background(.red)
            .scaleEffect(1 + gestureValve + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged{ value in
                        gestureValve = value - 1
                    }
                    .onEnded{ value in
                        lastAmount += gestureValve
                        gestureValve = 0
                    }
            )
    }
}

#Preview {
    MagnificationFGestureBootCamp()
}
