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
        // 5 decode incoming data to model
        // 6 sink(put the items to our app)
        // 7 store(cancle the subscription if needed)
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap (handleOutput)
            .decode(type: [ComebinePostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnModel) in
                self?.posts = returnModel
            })
            .store(in: &cancellables)

    }
    func handleOutput(output : URLSession.DataTaskPublisher.Output)throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse ,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
struct DownloadWithComebine: View {
    @StateObject var vm = ComebineViewModel()
    var body: some View {

        List {
            ForEach(vm.posts) { post in
                VStack (alignment : .leading){
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

