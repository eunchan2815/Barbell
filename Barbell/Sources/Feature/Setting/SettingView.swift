//
//  SettingView.swift
//  Barbell
//
//  Created by 김은찬 on 6/27/25.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        DefaultView("설정", true) {
            VStack {
                Text("x")
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                            HapticManager.instance.impact(style: .light)
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.foreground)
                            .font(.bold(16))
                    }
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
