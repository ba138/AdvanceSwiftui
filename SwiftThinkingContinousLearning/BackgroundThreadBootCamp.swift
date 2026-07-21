//
//  BackgroundThreadBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 21/07/2026.
//

import SwiftUI
import Combine
class BackgroundThreadViewModel : ObservableObject {
    @Published var dataArray : [String] = []
    
}
struct BackgroundThreadBootCamp: View {
    @StateObject var viewModel = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Loading Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootCamp()
}
