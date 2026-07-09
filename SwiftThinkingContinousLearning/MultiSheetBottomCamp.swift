//
//  MultiSheetBottomCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 08/07/2026.
//

import SwiftUI
struct RendomModel : Identifiable {
    let id = UUID().uuidString
    let title : String
}
// to update sheet we have three solutions
// Binding
// multiple.sheet
// items
struct MultiSheetBottomCamp: View {
    @State var selectedModel : RendomModel? = nil
    var body: some View {
        VStack (spacing : 20){
            Button("Button1") {
                selectedModel = RendomModel(title: "one")
            }
            
            Button("Button2") {
                selectedModel = RendomModel(title: "two")


            }
           
        }
        .sheet(item: $selectedModel) { model in
NextScreen(randomModel: model)
        }

    }
}
struct NextScreen : View {
   let randomModel : RendomModel
    var body: some View {
        Text(randomModel.title)
            .font(.headline)
    }
}

#Preview {
    MultiSheetBottomCamp()
}
