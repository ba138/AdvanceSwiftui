//
//  CoreDatBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 17/07/2026.
//

import SwiftUI
import Combine
import CoreData
class CoreDataViewModel : ObservableObject {
    let container: NSPersistentContainer
    init() {
        // Use your Core Data model name here instead of "SwiftThinkingContinousLearning" if different
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data store: \(error)")
            }
        }
    }
}

struct CoreDatBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDatBootCamp()
}
