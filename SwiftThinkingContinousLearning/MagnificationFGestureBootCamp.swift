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
        VStack{
            HStack{
                Circle()
                    .frame(width: 35,height: 35)
                Text("SwiftFull Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(20)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + gestureValve)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            // value is MagnificationGesture.Value; use its magnification factor
                            gestureValve = value - 1
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                gestureValve = 0
                            }
                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is caption for my photo")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(.red)
//            .scaleEffect(1 + gestureValve + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged{ value in
//                        gestureValve = value - 1
//                    }
//                    .onEnded{ value in
//                        lastAmount += gestureValve
//                        gestureValve = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationFGestureBootCamp()
}

