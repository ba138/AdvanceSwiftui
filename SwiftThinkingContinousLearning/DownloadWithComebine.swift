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
    @Published var posts : [ComebinePostModel] = [
        
    ]
}
struct DownloadWithComebine: View {
    @StateObject var vm = ComebineViewModel()
    var body: some View {

        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    DownloadWithComebine()
}
