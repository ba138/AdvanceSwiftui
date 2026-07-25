//
//  CodeableBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 25/07/2026.
//

import SwiftUI
import Combine
struct CustomerModel : Identifiable {
    let id : String
    let name : String
    let point : Int
}
class CustomerViewModel : ObservableObject {
    
}

struct CodeableBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CodeableBootCamp()
}
