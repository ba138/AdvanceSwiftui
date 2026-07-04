//
//  MagnificationFGestureBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 04/07/2026.
//

import SwiftUI

struct MagnificationFGestureBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .padding(40)
            .background(.red)
            .gesture(
                MagnificationGesture()
                    .onChanged{ value in
                        
                    }
            )
    }
}

#Preview {
    MagnificationFGestureBootCamp()
}
