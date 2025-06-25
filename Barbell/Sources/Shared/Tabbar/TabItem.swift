//
//  TabItem.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

enum TabItem: Int, CaseIterable {
    case home, counter, timer
    
    var icon: Image {
        switch self {
        case .home:
            Image(systemName: "waveform.path.ecg")
        case .counter:
            Image(systemName: "waveform.circle")
        case .timer:
            Image(systemName: "timer")
        }
    }
    
    var text: String {
        switch self {
        case .home:
            return "홈"
        case .counter:
            return "카운터"
        case .timer:
            return "타이머"
        }
    }
}
