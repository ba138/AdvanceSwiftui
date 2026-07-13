//
//  HashableProtocolBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 13/07/2026.
//

import SwiftUI
struct MyCustomModel : Identifiable {
    let id :String = UUID().uuidString
    let title : String
}
struct HashableProtocolBootCamp: View {
    let data : [MyCustomModel] =
    [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),

    ]
    var body: some View {
        ScrollView {
            VStack (spacing : 20){
                ForEach(data) { item in
                    Text(item.title)
                        .font(.title)
                }

            }
        }    }
}

#Preview {
    HashableProtocolBootCamp()
}
