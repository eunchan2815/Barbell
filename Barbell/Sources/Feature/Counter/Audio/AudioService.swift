//
//  AudioService.swift
//  Barbell
//
//  Created by 김은찬 on 6/26/25.
//

import AVFoundation

final class TTSService {
    private let tts = AVSpeechSynthesizer()
    private var isConfigured = false

    func speak(_ text: String) {
        configureAudioSessionIfNeeded()
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.4
        tts.speak(utterance)
    }

    private func configureAudioSessionIfNeeded() {
        guard !isConfigured else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            isConfigured = true
        } catch {
            print("⚠️ AVAudioSession 설정 실패: \(error)")
        }
    }
}
