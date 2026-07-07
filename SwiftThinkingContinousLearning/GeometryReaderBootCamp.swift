//
//  GeometryReaderBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 07/07/2026.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
        HStack(spacing : 0) {
            Rectangle()
                .fill(.red)
            Rectangle()
                .fill(.blue)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderBootCamp()
}
