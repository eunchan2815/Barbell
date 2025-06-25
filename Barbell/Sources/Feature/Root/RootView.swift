//
//  Rootview.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct RootView: View {
    @State private var selection: TabItem = .home
    var body: some View {
        BarbellTabView(selection: $selection) {
            switch selection {
            case .home:
                HomeView(selection: $selection)
            case .counter:
                CounterView()
            case .timer:
                TimerView()
            }
        }
    }
}

#Preview {
    RootView()
}
