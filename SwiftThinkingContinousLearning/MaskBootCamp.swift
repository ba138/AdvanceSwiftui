//
//  MaskBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 09/07/2026.
//

import SwiftUI

struct MaskBootCamp: View {
    var body: some View {
        ZStack {
            HStack{
                ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    MaskBootCamp()
}
