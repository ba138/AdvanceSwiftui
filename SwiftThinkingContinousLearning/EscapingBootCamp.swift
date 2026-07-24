//
//  EscapingBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 23/07/2026.
//

import SwiftUI
import Combine
class EscapingViewModel : ObservableObject {
    @Published var text : String = "Hello"
}
struct EscapingBootCamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
    }
}

#Preview {
    EscapingBootCamp()
}
