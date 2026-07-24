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
        downloadData3 { [weak self] data in
            self?.text = data
        }
    }
    func downloadData()-> String {
        return "New data"
    }
    func downloadData2(handler:(_ data : String)-> Void){
        handler("new data 2")
    }
    func downloadData3(handler:@escaping (_ data : String)-> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            handler("new data 2")

        })
    }
}
struct EscapingBootCamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootCamp()
}
