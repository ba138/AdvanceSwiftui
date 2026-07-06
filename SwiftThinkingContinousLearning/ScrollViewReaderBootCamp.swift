//
//  ScrollViewReaderBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 06/07/2026.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    @State private var myText : String = ""
    var body: some View {
        VStack(spacing: 0) {
            // Messages list
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HStack{
                        Circle()
                            .frame(width: 60)
                        VStack(alignment: .leading){
                            Text("Basit Ali")
                            Text("OnLine")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,10)
                    .padding(.top, 8)
                    ScrollViewReader{ proxy in
                        ForEach(0..<50) { index in
                            VStack(alignment: .trailing, spacing: 4){
                                Text("This is item # \(index)")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.green)
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.horizontal,10)
                                Text("19:20")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.horizontal,10)
                            }
                        }
                        // Extra spacer so last message isn't hidden by input bar
                        Color.clear.frame(height: 8)
                    }
                    .frame(maxWidth: .infinity)
                }
                    }
                    

            // Fixed input bar like WhatsApp
            HStack(spacing: 8) {
                TextField("Message", text: $myText, axis: .vertical)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .lineLimit(1...4)

                Button {
                    // Send action
                    myText = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
                .disabled(myText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.thinMaterial)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    ScrollViewReaderBootCamp()
}
