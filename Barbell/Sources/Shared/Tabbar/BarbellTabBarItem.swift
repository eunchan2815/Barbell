//
//  BarbellTabBarItem.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//
import SwiftUI

struct BarbellTabBarItem: View {
    let tabItem: TabItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                tabItem.icon
                Text(tabItem.text)
                    .font(.bold(12))
            }
            .foregroundStyle(Color.foreground)
            .frame(width: 50, height: 60)
            .background(
                isSelected ? Color.gray.opacity(0.15) : Color.clear
            )
            .clipShape(size: 10)
        }
    }
}
