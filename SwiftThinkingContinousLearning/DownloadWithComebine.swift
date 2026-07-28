//
//  DownloadWithComebine.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 28/07/2026.
//

import SwiftUI
import Combine
struct ComebinePostModel : Identifiable , Codable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
class ComebineViewModel : ObservableObject {
    @Published var post : [ComebinePostModel] = [
        
    ]
}
struct DownloadWithComebine: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithComebine()
}
