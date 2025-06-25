//
//  CounterViewModel.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import AVFoundation
import Combine

final class CounterViewModel: ObservableObject {
    @Published var currentCount: Int = 0
    @Published var progress: Double = 0.0
    @Published var rate: Float = 0.2
    @Published var totalCount: Int = 10
    
    var progressPercentage: Int {
        Int(progress * 100)
    }
    
    private let tts = AVSpeechSynthesizer()
    private var timer: Timer?
    private var preCountTimer: Timer?
    
    func starting() {
        stopAllTimers()
        currentCount = 0
        progress = 0.0
        
        speak("운동 시작합니다")
        
        var countdown = 8
        preCountTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if countdown > 0 {
                self.speak("\(countdown)")
                countdown -= 1
            } else {
                timer.invalidate()
                self.startMainCounting()
            }
        }
    }
    
    private func startMainCounting() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.currentCount < self.totalCount {
                self.currentCount += 1
                self.progress = Double(self.currentCount) / Double(self.totalCount)
                self.speak("\(self.currentCount)")
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = rate
        tts.speak(utterance)
    }
    
    func stop() {
        stopAllTimers()
    }
    
    func reset() {
        stopAllTimers()
        currentCount = 0
        progress = 0.0
    }
    
    private func stopAllTimers() {
        timer?.invalidate()
        preCountTimer?.invalidate()
    }
}
