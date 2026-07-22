//
//  WeakSelfBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 22/07/2026.
//

import SwiftUI

struct WeakSelfBootCamp: View {
    var body: some View {
        NavigationView {
          NavigationLink("Navigate", destination: WeakSelfScreen())
        }
    }
}
struct WeakSelfScreen : View {
    var body: some View {
        Text("Weak Self Screen")
            .font(.largeTitle)
            .foregroundColor(Color.red)
    }
}
#Preview {
    WeakSelfBootCamp()
}
