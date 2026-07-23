//
//  TypealiasBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 23/07/2026.
//

import SwiftUI
struct MovieModel {
    let title : String
    let director : String
    let count : Int
}
struct TypealiasBootCamp: View {
    @State var item : MovieModel = MovieModel(title: "j", director: "Jhon", count: 1200)
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypealiasBootCamp()
}
