//
//  HealthStore.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//


import HealthKit

final class HealthStore {
    let healthStore = HKHealthStore()
    
    // 걸음 수 타입
    public var stepType: HKQuantityType? {
        HKQuantityType.quantityType(forIdentifier: .stepCount)
    }
    
    // 권한 요청
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let stepType else {
            completion(false)
            return
        }

        healthStore.requestAuthorization(toShare: [], read: [stepType]) { success, _ in
            completion(success)
        }
    }
}
