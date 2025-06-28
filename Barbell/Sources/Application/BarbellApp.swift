//
//  BarbellApp.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

@main
struct BarbellApp: App {
    @AppStorage("darkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
