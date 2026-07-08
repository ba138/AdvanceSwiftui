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
struct MultiSheetBottomCamp: View {
    @State var selectedModel : RendomModel = RendomModel(title: "Starting model")
    @State var showSheet : Bool = false
    var body: some View {
        VStack (spacing : 20){
            Button("Button1") {
                selectedModel = RendomModel(title: "One")
            }
            Button("Button2") {
                selectedModel = RendomModel(title: "Two")

            }
        }
        .sheet(isPresented: $showSheet) {
            NextScreen(randomModel: selectedModel)
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
