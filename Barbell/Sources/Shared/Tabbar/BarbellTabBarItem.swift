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
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                HapticManager.instance.impact(style: .light)
                action()
            }
        } label: {
            VStack(spacing: 10) {
                tabItem.icon
                Text(tabItem.text)
                    .font(.bold(12))
            }
            .foregroundStyle(Color.foreground)
            .frame(width: 55, height: 60)
            .background(
                isSelected ? Color.gray.opacity(0.15) : Color.clear
            )
            .clipShape(size: 10)
        }
    }
}
