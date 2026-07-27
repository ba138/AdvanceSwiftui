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
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        downloadData(fromUrl: url) { returnedData in
            
            guard let data = returnedData else {
                print("No Data returned.")
                return
            }
            
            guard let posts = try? JSONDecoder().decode([PostModel].self, from: data) else {
                print("Decoding failed")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.post = posts
            }
        }
    }
    func downloadData(fromUrl url : URL ,completionHandler : @escaping (_ data : Data?) -> () ){
       
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            guard
                let data = data ,
            error == nil ,
                let response  = response as? HTTPURLResponse ,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error getting data")
                completionHandler(nil)

                return
                
            }
            
          
          completionHandler(data)
         
        }.resume()
    }
}
struct DownloadWithEscapingBootCamp: View {
    @StateObject var vm = DownloadViewModel()
    var body: some View {
        List {
            ForEach(vm.post) { post in
                VStack{
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
    DownloadWithEscapingBootCamp()
}
