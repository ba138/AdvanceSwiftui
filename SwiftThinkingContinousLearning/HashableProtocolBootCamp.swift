//
//  HashableProtocolBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 13/07/2026.
//

import SwiftUI
struct MyCustomModel {
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
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }

            }
        }    }
}

#Preview {
    HashableProtocolBootCamp()
}
