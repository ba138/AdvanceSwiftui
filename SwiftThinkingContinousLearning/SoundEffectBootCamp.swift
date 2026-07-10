//
//  SoundEffectBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 10/07/2026.
//

import SwiftUI
import AVKit
class SoundManger{
    static let istance = SoundManger()
    var player : AVAudioPlayer?
    
}
struct SoundEffectBootCamp: View {
    @State var soundManger : SoundManger = SoundManger()
    var body: some View {
        VStack (spacing : 20){
            Button("Play Sound 1") {
                
            }
            Button("Play Sound 2") {
                
            }
        }
    }
}

#Preview {
    SoundEffectBootCamp()
}
