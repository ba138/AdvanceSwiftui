//
//  CoreDataRelationShipBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 18/07/2026.
//

import SwiftUI
import Combine
import CoreData
class CoreDataManager {
    static let cm = CoreDataManager()
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    init(){
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description , error) in
            if let error = error {
                print("Loading error \(error)")
            }
        }
        context = container.viewContext
    }
    func saveData(){
        do{
            try context.save()
        }catch let error {
            print("Error saving core data \(error)")
        }
    }
}
class CoreDataRelationShipViewModel : ObservableObject{
    
    let manager = CoreDataManager.cm
    @Published var business : [BusinessEntity] = []
    func addBusinees(){
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    func save(){
        manager.saveData()
    }
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
