//
//  ArrayBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 14/07/2026.
//

import SwiftUI
import Combine
struct UserModel : Identifiable{
    let id  : String = UUID().uuidString
    let name : String
    let points : Int
    let isVerfied : Bool
}
class ArrayModificationViewModel: ObservableObject {

    @Published var dataArray: [UserModel] = []

    init() {
        getUsers()
    }

    func getUsers() {
        let user1 = UserModel(name: "Basit", points: 5, isVerfied: false)
        let user2 = UserModel(name: "Fayyaz", points: 5, isVerfied: true)
        let user3 = UserModel(name: "Touseef", points: 4, isVerfied: true)
        let user4 = UserModel(name: "Atizaz", points: 10, isVerfied: false)

        self.dataArray.append(
            contentsOf: [user1, user2, user3, user4]
)
    }
}
struct ArrayBootCamp: View {
    @State var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing : 20) {
                ForEach(vm.dataArray) { item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    ArrayBootCamp()
}
