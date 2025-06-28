//
//  BellButton.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import SwiftUI

struct BellButton: View {
    @State private var isToggle = false
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 45, height: 45)
                    .overlay {
                        Image(systemName: isToggle ? "bell" : "bell.slash")
                            .foregroundStyle(Color.foreground)
                    }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("테마")
                        .font(.bold(16))
                        .foregroundStyle(Color.foreground)
                    
                    Text(isToggle ? "알림 켜짐": "알람 꺼짐")
                        .font(.medium(14))
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 2)
                
                Spacer()
                
                
                Toggle("", isOn: $isToggle)
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
    BellButton()
}
