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
        downloadData4 { [weak self] DownloadResult in
            self?.text = DownloadResult.text
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
            handler("new data 3")

        })
    }
    func downloadData4(handler:@escaping (DownloadResult)-> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let result = DownloadResult(text: "Data 4")
handler(result)
        })
    }

}
struct DownloadResult {
    let text : String
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
