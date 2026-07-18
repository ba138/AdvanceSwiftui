//
//  CoreDataRelationShipBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 18/07/2026.
//

import SwiftUI
import Combine
class CoreDataRelationShipViewModel : ObservableObject{
    let instance = CoreDataRelationShipBootCamp()
    
}
struct CoreDataRelationShipBootCamp: View {
    @StateObject var vm = CoreDataRelationShipViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDataRelationShipBootCamp()
}
