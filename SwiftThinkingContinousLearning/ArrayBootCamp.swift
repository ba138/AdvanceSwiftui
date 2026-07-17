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
    @Published var filteredArray : [UserModel] = []
    @Published var mappedArray : [String] = []

    init() {
        getUsers()
        updateFilteredArray()
    }
    func updateFilteredArray() {
        //sort
        /*
//        let sortedArray = dataArray.sorted { user1, user2 in
//            user1.points > user2.points
//        }
//
//        filteredArray = sortedArray
        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
         */
        //Filter
        /*
//        filteredArray = dataArray.filter({ (user) -> Bool in
////            return user.points > 5
////            return user.isVerfied
//            return user.name.contains("i")
//        })
        //short way
        filteredArray = dataArray.filter({$0.name.contains("a")})
         */
        //Map
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name
//        })
        //short way for map
//        mappedArray = dataArray.map({$0.name})
    }
    func getUsers() {
        let user1 = UserModel(name: "Basit", points: 5, isVerfied: true)
        let user2 = UserModel(name: "Fayyaz", points: 5, isVerfied: true)
        let user3 = UserModel(name: "Touseef", points: 4, isVerfied: true)
        let user4 = UserModel(name: "Atizaz", points: 10, isVerfied: false)
        let user5 = UserModel(name: "Ali", points: 5, isVerfied: true)
        let user6 = UserModel(name: "Hussain", points: 5, isVerfied: true)
        let user7 = UserModel(name: "Hassan", points: 4, isVerfied: true)
        let user8 = UserModel(name: "Haider", points: 10, isVerfied: false)
        let user9 = UserModel(name: "Hassan", points: 4, isVerfied: true)
        let user10 = UserModel(name: "Haider", points: 10, isVerfied: false)

        self.dataArray.append(
            contentsOf: [user1, user2, user3, user4 ,user5 ,user6 ,user7 ,user8 ,user9 ,user10]
)
    }
}
struct ArrayBootCamp: View {
    @State var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing : 20) {
                /*
                ForEach(vm.filteredArray) { item in
                    VStack(alignment : .leading){
                        Text(item.name)
                            .font(.headline)
                        HStack{
                            Text("\(item.points)")
                            Spacer()
                            if item.isVerfied{
                                Image(systemName: "flame.fill")
                            }  else{
                                
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .padding(.horizontal)
                    
                }
                 */
                VStack{
                    ForEach(vm.mappedArray, id: \.self) {item in
                        Text(item)
                    }
                }
            }
        }
    }
}

#Preview {
    ArrayBootCamp()
}
