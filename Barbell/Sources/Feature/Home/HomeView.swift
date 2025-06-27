//
//  HomeView.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var selection: TabItem
    var body: some View {
        DefaultView("홈", false) {
            ScrollView {
                VStack(spacing: 14) {
                    StepComponent()
                    CounterComponent {
                        selection = .counter
                    }
                    TimerComponent {
                        selection = .timer
                    }
                    Spacer()
                }
            }
        }
    }
}
