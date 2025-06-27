//
//  HapticManager.swift
//  Barbell
//
//  Created by 김은찬 on 6/27/25.
//

import UIKit

@MainActor
public class HapticManager {
    public static let instance = HapticManager()

    private init() {}

    public func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
