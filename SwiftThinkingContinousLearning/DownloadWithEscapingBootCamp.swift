//
//  DownloadWithEscapingBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 27/07/2026.
//

import SwiftUI
import Combine
struct PostModel : Identifiable , Codable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
class DownloadViewModel : ObservableObject {
    @Published var post : [PostModel] = []
    init(){
        getPosts()
    }
    func getPosts(){
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            guard let data = data else{
                print("no data.")
                return
            }
            guard  error == nil else {
                print("error : \(String(describing: error))")
            return
            }
            guard let response  = response as? HTTPURLResponse else{
                print("Invalid Response.")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else{
                print("status code is 2xx but is \(response.statusCode)")
                return
            }
            print("Sucessfully download data!")
            print(data)
            let jsonStirng = String(data: data, encoding: .utf8)
            print(jsonStirng)
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.post.append(newPost)

            }
        }.resume()
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
