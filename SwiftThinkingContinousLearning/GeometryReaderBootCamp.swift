//
//  GeometryReaderBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 07/07/2026.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing : 0) {
                
                Rectangle()
                    .fill(.red)
                    .frame(width: geometry.size .width * 0.666 )
                Rectangle()
                    .fill(.blue)
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    GeometryReaderBootCamp()
}
