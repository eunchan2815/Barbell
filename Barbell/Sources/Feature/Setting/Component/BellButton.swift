//
//  BellButton.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import SwiftUI

struct BellButton: View {
    @Binding var isToggle: Bool
    let text: String
    var onToggleOn: () -> Void
    
    init(isToggle: Binding<Bool>, text: String, onToggleOn: @escaping () -> Void) {
        self._isToggle = isToggle
        self.text = text
        self.onToggleOn = onToggleOn
    }
    
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
                    Text("알림")
                        .font(.bold(16))
                        .foregroundStyle(Color.foreground)
                    
                    Text(isToggle ? "알림 켜짐\n\(text)": "알람 꺼짐")
                        .font(.medium(14))
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 2)
                
                Spacer()
                
                
                Toggle("", isOn: $isToggle)
                    .toggleStyle(SwitchToggleStyle(tint: Color.background))
                    .onChange(of: isToggle) { newValue in
                        if newValue {
                            onToggleOn()
                        }
                    }
            }
        }
        .padding(18)
        .background(Color.sub)
        .clipShape(size: 12)
        .padding(.horizontal, 16)
    }
}
