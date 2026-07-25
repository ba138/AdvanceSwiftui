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
    @Published var customer : CustomerModel? = nil
    init(){
      getData()
    }
    func getData(){
        guard let data = getJson() else {return}
        if
            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = localData as? [String:Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let point = dictionary["point"] as? Int,
            let isOPremium = dictionary["isOPremium"] as? Bool
        {
           let newCustomer = CustomerModel(id: id, name: name, point: point, isOPremium: isOPremium)
            customer = newCustomer
        }
    }
    func getJson() -> Data? {
        let dictionary: [String: Any] = [
            "id": "12345",
            "name": "Ali",
            "point": 100,
            "isOPremium": true
        ]

        return try? JSONSerialization.data(withJSONObject: dictionary)
    }
}

struct CodeableBootCamp: View {
    @StateObject var vm = CustomerViewModel()
    var body: some View {
        if let customer = vm.customer{
            Text(customer.name)
            Text(customer.id)
            Text("\(customer.point)")
            Text("\(customer.isOPremium.description)")
        }    }
}

#Preview {
    CodeableBootCamp()
}
