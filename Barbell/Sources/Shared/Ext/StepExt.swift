//
//  StepExt.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import Foundation
import HealthKit

extension HealthStore {
    func fetchTodayStepCount(completion: @escaping (Double) -> Void) {
        guard let stepType else {
            completion(0)
            return
        }
        
        let startOfDay = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType,
                                      quantitySamplePredicate: predicate,
                                      options: .cumulativeSum) { _, result, _ in
            guard let quantity = result?.sumQuantity() else {
                completion(0)
                return
            }
            
            let steps = quantity.doubleValue(for: HKUnit.count())
            DispatchQueue.main.async {
                completion(steps)
            }
        }
        
        healthStore.execute(query)
    }
}

