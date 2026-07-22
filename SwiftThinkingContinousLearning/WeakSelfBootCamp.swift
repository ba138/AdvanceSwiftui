//
//  WeakSelfBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 22/07/2026.
//

import SwiftUI
import Combine
struct WeakSelfBootCamp: View {
    @AppStorage("count") var count : Int?
    init(){
        count = 0
    }
    var body: some View {
        NavigationView {
          NavigationLink("Navigate", destination: WeakSelfScreen())
                .overlay (
                    VStack{
                        
                        Text("\(count ?? 0)")
                            .font(.largeTitle)
                           
                            .padding()
                            .background(Color.green.cornerRadius(10))
                        Spacer()
                    }
                        .frame(height: 200)
                        
                    
                )
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
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount+1, forKey: "count")
        fetchData()
    }
    deinit{
        print("deinit data")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount-1, forKey: "count")
    }
    func fetchData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 500){ [weak self] in
            self?.data = "new data"

            
        }
    }
}
#Preview {
    WeakSelfBootCamp()
}
