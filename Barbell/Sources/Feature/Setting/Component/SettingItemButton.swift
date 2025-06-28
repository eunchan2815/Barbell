//
//  CounterComponent.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct SettingItemButton: View {
    let imageName: String
    let title: String
    let description: String
    let action: () -> Void
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                HapticManager.instance.impact(style: .light)
                action()
            }
        } label: {
            VStack {
                HStack {
                    Circle()
                        .fill(.gray.opacity(0.15))
                        .frame(width: 45, height: 45)
                        .overlay {
                            Image(imageName)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.foreground)
                        }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .font(.bold(16))
                            .foregroundStyle(Color.foreground)
                        
                        Text(description)
                            .font(.medium(14))
                            .foregroundStyle(.gray)
                    }
                    .padding(.leading, 2)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }
            }
            .padding(18)
            .background(Color.sub)
            .clipShape(size: 12)
            .padding(.horizontal, 16)
        }
    }
}
