//
//  WeakSelfBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 22/07/2026.
//

import SwiftUI
import Combine
struct WeakSelfBootCamp: View {
    var body: some View {
        NavigationView {
          NavigationLink("Navigate", destination: WeakSelfScreen())
        }
    }
}
struct WeakSelfScreen : View {
    @StateObject var vm = WeakSelfBootViewModel()
    var body: some View {
        VStack{
            Text("Weak Self Screen")
                .font(.largeTitle)
                .foregroundColor(Color.red)
            if let data = vm.data {
                Text(data)
            }
        }
    }
}
class WeakSelfBootViewModel : ObservableObject {
    @Published var data :String? = nil
    init(){
     print("getting data")
        fetchData()
    }
    deinit{
        print("deinit data")
    }
    func fetchData(){
      data = "new data"
    }
}
#Preview {
    WeakSelfBootCamp()
}
