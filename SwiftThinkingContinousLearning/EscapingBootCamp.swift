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
    func getData(){
        downloadData2 { data in
            text = data
        }
    }
    func downloadData()-> String {
        return "New data"
    }
    func downloadData2(handler:(_ data : String)-> Void){
        handler("new data 2")
    }
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
