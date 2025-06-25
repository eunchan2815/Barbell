//
//  StepViewModel.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import Foundation

final class StepViewModel: ObservableObject {
    private let healthStore = HealthStore()
    
    @Published var stepCount: Int?
    @Published var completionPercentage: Double = 0.0
    private let goalSteps = 10000
    
    init() {
        healthStore.requestAuthorization { [weak self] success in
            if success {
                self?.fetchSteps()
            }
        }
    }
    
    func fetchSteps() {
        healthStore.fetchTodayStepCount { [weak self] steps in
            self?.stepCount = Int(steps)
            self?.updateCompletionPercentage()
        }
    }
    
    private func updateCompletionPercentage() {
        guard let stepCount = stepCount else {
            completionPercentage = 0.0
            return
        }
        completionPercentage = min(Double(stepCount) / Double(goalSteps), 1.0)
    }
    
    var completionPercentageInt: Int {
        return Int(completionPercentage * 100)
    }
}
