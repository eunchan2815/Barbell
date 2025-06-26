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
    @Published var rate : RateMenu
    @Published var totalCount: Int
    @Published var isPaused: Bool = false
    
    let rateMenu: [RateMenu] = [
        RateMenu(rateLabel: "느림", multiplier: 0.4),
        RateMenu(rateLabel: "조금 느림", multiplier: 0.7),
        RateMenu(rateLabel: "보통", multiplier: 1.0),
        RateMenu(rateLabel: "조금 빠름", multiplier: 1.7),
        RateMenu(rateLabel: "빠름", multiplier: 1.8)
    ]
    
    let countMenu: [Int] = [10, 30, 50, 80, 100, 200]
    
    init() {
        if let savedRateData = UserDefaults.standard.data(forKey: "rate"),
           let decodedRate = try? JSONDecoder().decode(RateMenu.self, from: savedRateData) {
            self.rate = decodedRate
        } else {
            self.rate = RateMenu(rateLabel: "보통", multiplier: 1.0)
        }
        
        self.totalCount = UserDefaults.standard.integer(forKey: "totalCount")
        if self.totalCount == 0 {
            self.totalCount = 50
        }
    }
    
    private let metronome = SoundPlayer()
    private let ttsService = TTSService()
    private var timer: Timer?
    private var preCountTimer: Timer?
    private var hasStartedOnce: Bool = false
    
    func startOrResume() {
        if isPaused {
            isPaused = false
            starting(resetProgress: false)
        } else {
            starting(resetProgress: true)
        }
    }
    
    func starting(resetProgress: Bool = true) {
        stopAllTimers()
        
        if resetProgress {
            currentCount = 0
            progress = 0.0
            hasStartedOnce = false
        }
        
        if !isPaused && !hasStartedOnce {
            ttsService.speak("운동 시작")
            hasStartedOnce = true
            
            var countdown = 8
            preCountTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                if countdown > 0 {
                    self.ttsService.speak("\(countdown)")
                    countdown -= 1
                } else {
                    timer.invalidate()
                    self.startMainCounting()
                }
            }
        } else {
            startMainCounting()
        }
    }
    
    private func startMainCounting() {
        let baseInterval = 2.0
        let interval = baseInterval / rate.multiplier
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.currentCount < self.totalCount {
                self.metronome.playSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.ttsService.speak("\(self.currentCount)")
                }
                self.currentCount += 1
                self.progress = Double(self.currentCount) / Double(self.totalCount)
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    
    func stop() {
        stopAllTimers()
        isPaused = true
    }
    
    func reset() {
        stopAllTimers()
        currentCount = 0
        progress = 0.0
        isPaused = false
        hasStartedOnce = false
    }
    
    private func stopAllTimers() {
        timer?.invalidate()
        preCountTimer?.invalidate()
    }
    
    func saveSettings() {
        if let encoded = try? JSONEncoder().encode(rate) {
            UserDefaults.standard.set(encoded, forKey: "rate")
        }
        UserDefaults.standard.set(totalCount, forKey: "totalCount")
    }
}
