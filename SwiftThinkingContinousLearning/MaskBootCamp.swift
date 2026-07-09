//
//  MaskBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 09/07/2026.
//

import SwiftUI

struct MaskBootCamp: View {
    @State var rating : Int = 3
    var body: some View {
        ZStack {
            ratingView
        }
    }
    private var ratingView : some View{
        HStack{
            ForEach(1..<6) { index in
            Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating>=index ?  .yellow : .gray)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

#Preview {
    MaskBootCamp()
}
