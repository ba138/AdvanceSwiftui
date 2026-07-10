//
//  MaskBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 09/07/2026.
//

import SwiftUI

struct MaskBootCamp: View {
    @State var rating : Int = 0
    var body: some View {
        ZStack {
            ratingView
                .overlay {
                   overLayView
                        .mask(ratingView)
                }
        }
    }
    private var overLayView : some View{
        GeometryReader{ geometry in
            ZStack (alignment : .leading){
                Rectangle()
                    .foregroundColor(.yellow)
//                                .mask(ratingView)
                    .frame(width: CGFloat(rating)/5 * geometry.size.width)

            }
        }
        .allowsHitTesting(false)
    }
    private var ratingView : some View{
        HStack{
            ForEach(1..<6) { index in
            Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation (.easeInOut){
                            rating = index

                        }                    }
            }
        }
    }
}

#Preview {
    MaskBootCamp()
}
