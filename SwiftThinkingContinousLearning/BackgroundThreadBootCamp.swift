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
    func fetchData()
    {
        DispatchQueue.global().async {
            let newData = self.downloadData()
            // for updating ui we use main thread not background thread there i use main
            DispatchQueue.main.async {
                self.dataArray = newData

            }
        }
    
    }
   private func downloadData()-> [String]{
        var data : [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}
struct BackgroundThreadBootCamp: View {
    @StateObject var viewModel = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Text("Loading Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
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
