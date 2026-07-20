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

    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")

        container.loadPersistentStores { description, error in
            if let error = error {
                print("Loading error: \(error)")
            }
        }

        context = container.viewContext
    }

    func saveData() {
        do {
            try context.save()
            print("Saved Core Data successfully")
        } catch {
            print("Error saving Core Data: \(error)")
        }
    }
}

class CoreDataRelationShipViewModel: ObservableObject {

    let manager = CoreDataManager.cm

    @Published var business: [BusinessEntity] = []
    @Published var departmentd : [DepartmentEntity] = []

    init() {
        getBusiness()
    }

    func getBusiness() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")

        do {
            business = try manager.context.fetch(request)
            print("Fetched \(business.count) businesses")
        } catch {
            print("Error fetching businesses: \(error)")
        }
    }
    func getDepartment() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")

        do {
            departmentd = try manager.context.fetch(request)
            print("Fetched \(departmentd.count) department")
        } catch {
            print("Error fetching department: \(error)")
        }
    }
    func addBusiness() {

        // Create Business
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"

        // Create Department
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Sells"

        // Link Business -> Department
        newBusiness.addToDepartments(newDepartment)
//         Uncomment if you also want an employee
               let employee = EmployeeEntity(context: manager.context)
               employee.name = "Hussain Ali"
        employee.age = 26
        employee.dateJoined = Date.now
        
               newBusiness.addToEmployees(employee)

        save()
    }

    func save() {
        manager.saveData()
        getBusiness()
        getDepartment()
    }
    func deleteAllData() {

        let entityNames = [
            "BusinessEntity",
            "DepartmentEntity",
            "EmployeeEntity"
        ]

        entityNames.forEach { entityName in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try manager.context.execute(deleteRequest)
                print("Deleted all \(entityName)")
            } catch {
                print("Error deleting \(entityName): \(error)")
            }
        }

        save()
    }
}

struct CoreDataRelationShipBootCamp: View {

    @StateObject var vm = CoreDataRelationShipViewModel()

    var body: some View {

        NavigationView {

            VStack {

                Button("Add Business") {
                    vm.addBusiness()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.blue)
                .cornerRadius(12)
                .padding(.horizontal)
                Button("Clear Core Data") {
                    vm.deleteAllData()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.red)
                .cornerRadius(12)
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: true) {

                    HStack(alignment: .top) {

                        ForEach(vm.business) { business in
                            BusinessView(entity: business)
                        }
                    }
                    .padding(.horizontal)
                }
                ScrollView(.horizontal, showsIndicators: true) {

                    HStack(alignment: .top) {

                        ForEach(vm.departmentd) { item in
                            DepartmentView(entity: item)
                        }
                    }
                    .padding(.horizontal)
                }
                

                Spacer()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {

    let entity: BusinessEntity

    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Business")
                .font(.headline)

            Text(entity.name ?? "Unknown")

            Divider()

            Text("Departments")
                .bold()

            if let departments = entity.departments?.allObjects as? [DepartmentEntity],
               !departments.isEmpty {

                ForEach(departments) { department in
                    Text(department.name ?? "")
                }

            } else {
                Text("No Departments")
                    .foregroundColor(.gray)
            }

            Divider()

            Text("Employees")
                .bold()

            if let employees = entity.employees?.allObjects as? [EmployeeEntity],
               !employees.isEmpty {

                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }

            } else {
                Text("No Employees")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 280, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
struct DepartmentView: View {

    let entity: DepartmentEntity

    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Department")
                .font(.headline)

            Text(entity.name ?? "Unknown")

            Divider()

            Text("Business")
                .bold()

            if let business = entity.businesses?.allObjects as? [BusinessEntity],
               !business.isEmpty {

                ForEach(business) { item in
                    Text(item.name ?? "")
                }

            } else {
                Text("No Business")
                    .foregroundColor(.gray)
            }

            Divider()

            Text("Employees")
                .bold()

            if let employees = entity.employees?.allObjects as? [EmployeeEntity],
               !employees.isEmpty {

                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }

            } else {
                Text("No Employees")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 280, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    CoreDataRelationShipBootCamp()
}
