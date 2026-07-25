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
    let isOPremium : Bool
}
class CustomerViewModel : ObservableObject {
    @Published var customer : CustomerModel? = CustomerModel(id: "1", name: "Basit", point: 100, isOPremium: true)
}

struct CodeableBootCamp: View {
    @StateObject var vm = CustomerViewModel()
    var body: some View {
        if let customer = vm.customer{
            Text(customer.name)
            Text(customer.id)
            Text("\(customer.point)")
            Text("\(customer.isOPremium)")
        }    }
}

#Preview {
    CodeableBootCamp()
}
