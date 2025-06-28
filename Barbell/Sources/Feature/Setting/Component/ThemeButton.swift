//
//  ThemeButton.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import SwiftUI

struct ThemeButton: View {
    @AppStorage("darkMode") private var isDarkMode: Bool = false
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 45, height: 45)
                    .overlay {
                        Image(systemName: isDarkMode ? "moon" : "sun.max")
                            .foregroundStyle(Color.foreground)
                    }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("테마")
                        .font(.bold(16))
                        .foregroundStyle(Color.foreground)
                    
                    Text(isDarkMode ? "다크 모드": "라이트 모드")
                        .font(.medium(14))
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 2)
                
                Spacer()
                
                
                Toggle("", isOn: $isDarkMode)
                    .toggleStyle(SwitchToggleStyle(tint: Color.background))
            }
        }
        .padding(18)
        .background(Color.sub)
        .clipShape(size: 12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ThemeButton()
}
