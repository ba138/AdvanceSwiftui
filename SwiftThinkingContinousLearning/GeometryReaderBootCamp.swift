//
//  GeometryReaderBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 07/07/2026.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    func getPercantage(geo : GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentx = geo.frame(in: .global).midX
        return Double(1-(currentx/maxDistance))
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0..<50) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 12)
                            .rotation3DEffect(Angle(degrees: getPercantage(geo: geometry) * 40),
                                              axis: (x: 0, y: 1.0, z: 0))
                            
                    }
                    .frame(width: 300 ,height: 250)
                    .padding()
                    
                }
            }
        }
//        GeometryReader{ geometry in
//            HStack(spacing : 0) {
//                
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: geometry.size .width * 0.666 )
//                Rectangle()
//                    .fill(.blue)
//            }
//            .ignoresSafeArea()
//
//        }
    }
}

#Preview {
    GeometryReaderBootCamp()
}
