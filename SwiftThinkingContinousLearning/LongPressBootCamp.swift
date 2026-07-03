//
//  LongPressBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 03/07/2026.
//

import SwiftUI

struct LongPressBootCamp: View {
    @State var isCompleted : Bool = false
    @State var isSucees : Bool = false
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
                .fill(isSucees ? Color.green : Color.blue)
                .frame(maxWidth:isCompleted ? .infinity : 0)

                .frame(height: 55)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .background(.gray)
                .padding()
            HStack{
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50, pressing: { isPressing in
                        if isPressing {
                            withAnimation(.easeIn(duration: 1)) {
                                isCompleted = true
                            }
                        } else {
                            if !isSucees {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    isCompleted = false
                                }
                            }
                        }
                    }, perform: {
                        withAnimation(.easeInOut) {
                            isSucees = true
                            isCompleted = true
                        }
                    })
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(12)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            isCompleted = false
                            isSucees = false
                        }
                    }
                
            }
            
        }
    }
}

#Preview {
    LongPressBootCamp()
}
