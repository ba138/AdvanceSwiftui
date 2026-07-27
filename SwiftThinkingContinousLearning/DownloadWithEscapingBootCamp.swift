//
//  DownloadWithEscapingBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 27/07/2026.
//

import SwiftUI
import Combine
class DownloadViewModel : ObservableObject {
    init(){
        
    }
    func getPosts(){
        
    }
}
struct DownloadWithEscapingBootCamp: View {
    @StateObject var vm = DownloadViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithEscapingBootCamp()
}
