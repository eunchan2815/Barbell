//
//  Sound.swift
//  Barbell
//
//  Created by 김은찬 on 6/26/25.
//

import AVFoundation

class SoundPlayer {
    private var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "metronome", withExtension: "mp3") else {
            print("Metronome sound file not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing metronome: \(error)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
