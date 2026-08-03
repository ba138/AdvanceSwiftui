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
    private var cancellables = Set<AnyCancellable>()
    init(){
     getPosts()
    }
    func getPosts(){
        guard let url = URL(string : "https://jsonplaceholder.typicode.com/posts") else { return }
        // 1 create publisher
        // 2 subscribe to publisher
        // 3 recieve on mian thread
        // 4 trycatch (this will check the data is good)
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
            guard
                let response = response as? HTTPURLResponse ,
                response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
                return data
            }
            .decode(type: [ComebinePostModel].self, decoder: JSONDecoder())
            .sink { (completion) in
             print("COMPLETION : \(completion)")
            } receiveValue: { (returnModel) in
                self.posts = returnModel
            }
            .store(in: &cancellables)

    }
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

