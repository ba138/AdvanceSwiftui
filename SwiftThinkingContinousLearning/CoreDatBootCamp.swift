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
    @Published var saveEntityList : [FruitsEntity] = []
    init() {
        // Use your Core Data model name here instead of "SwiftThinkingContinousLearning" if different
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data store: \(error)")
            }else{
                print("Successfully load core data!")
            }
        }
        fetchData()
    }
    func fetchData(){
        let request = NSFetchRequest<FruitsEntity>(entityName: "FruitsEntity")
        do{
         saveEntityList =   try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching entity \(error)")
        }
    }
    func saveEntity(text: String) {
        let newFruit = FruitsEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    func updateEntity(entity : FruitsEntity){
        let currentName  = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    func deleteEntity(indexSet :IndexSet){
        guard let index = indexSet.first else{return}
        let entity = saveEntityList[index]
        container.viewContext.delete(entity)
        saveData()
    }
    func saveData(){
        do{
         try container.viewContext.save()
            fetchData()

        }catch let error{
            print("Error saving data \(error)")
        }
    }
}

struct CoreDatBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var fruitText: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing : 20) {
                TextField("Enter Fruit Name", text: $fruitText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding()
                Button {
                    guard !fruitText.isEmpty else { return }
                    vm.saveEntity(text: fruitText)
                    fruitText = ""
                } label: {
                    Text("Add Fruit")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(12)
                        .padding()
                }
                List {
                    ForEach(vm.saveEntityList) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                vm.updateEntity(entity: item)
                            }
                    }
                    .onDelete(perform: vm.deleteEntity)
                }
                .listStyle(PlainListStyle())
                

            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDatBootCamp()
}
