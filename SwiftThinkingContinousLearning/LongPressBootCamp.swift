//
//  LongPressBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 03/07/2026.
//

import SwiftUI

struct LongPressBootCamp: View {
    @State var isCompleted : Bool = false
    var body: some View {
//        Text(isCompleted ? "Completed" : "Not Completed")
//            .foregroundColor(.white)
//            .padding()
//            .padding(.horizontal,20)
//            .background(isCompleted ? Color.green : Color.gray)
//            .cornerRadius(12)
//            .onLongPressGesture(minimumDuration : 1.0) {
//                isCompleted.toggle()
//            }
        VStack{
            Rectangle()
                .frame(height: 55)
                .frame(width: 20)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .background(.gray)
                .padding()
            HStack{
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                
            }
            
        }
    }
}

#Preview {
    LongPressBootCamp()
}
