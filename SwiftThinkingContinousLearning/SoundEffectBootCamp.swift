//
//  SoundEffectBootCamp.swift
//  SwiftThinkingContinousLearning
//
//  Created by Basit Ali on 10/07/2026.
//

import SwiftUI
import AVFoundation
class SoundManger{
    static let istance = SoundManger()
    var player : AVAudioPlayer?
    func playSound(sound : String){
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else { return }
        do{
            player = try  AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error {
            print("this is the error \(error)")
        }
    }
    
}
struct SoundEffectBootCamp: View {
    @State private var soundManger: SoundManger = SoundManger()
    var body: some View {
        VStack (spacing : 20){
            Button("Play Sound 1") {
                soundManger.playSound(sound: "tada")
            }
            Button("Play Sound 2") {
                soundManger.playSound(sound: "small")
            }
        }
    }
}

#Preview {
    SoundEffectBootCamp()
}
