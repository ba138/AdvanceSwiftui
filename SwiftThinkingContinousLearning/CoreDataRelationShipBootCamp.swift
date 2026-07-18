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
        container = NSPersistentContainer(name: "CoreDataContainer")
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
            print("save core data successfuly")
        }catch let error {
            print("Error saving core data \(error)")
        }
    }
}
class CoreDataRelationShipViewModel : ObservableObject{
    
    let manager = CoreDataManager.cm
    @Published var business : [BusinessEntity] = []
    init(){
        getBusiness()
    }
    func getBusiness(){
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
      business = try manager.context.fetch(request)
            print("fetched business")

        }catch let error {
            print("Error While fetching the businesses\(error)")
        }
    }
    func addBusinees(){
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "MicroSoft"
        save()
        getBusiness()
    }
    func save(){
        manager.saveData()
    }
}

struct CoreDataRelationShipBootCamp: View {
    @StateObject var vm = CoreDataRelationShipViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Button {
                    vm.addBusinees()
                    
                } label: {
                    Text("Perfrom Action")
                    
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.green)
                        .cornerRadius(12)
                        .padding()
                }
                List {
                    ForEach(vm.business) { business in
                        Text(business.name ?? "")
                    }
                }.listStyle(.plain)
            }
            .navigationTitle("RelationShips")

        }

         
    }
}

#Preview {
    CoreDataRelationShipBootCamp()
}
