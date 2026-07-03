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
        Text(isCompleted ? "Completed" : "Not Completed")
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal,20)
            .background(Color.green)
            .cornerRadius(12)
    }
}

#Preview {
    LongPressBootCamp()
}
