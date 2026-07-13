//
//  HashableProtocolBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 13/07/2026.
//

import SwiftUI

struct HashableProtocolBootCamp: View {
    let data : [String] =
    [
        "One",
        "Two",
        "Three",
        "Four"
    ]
    var body: some View {
        ForEach(data, id: \.self) { item in
            Text(item)
                .font(.headline)
        }
    }
}

#Preview {
    HashableProtocolBootCamp()
}
