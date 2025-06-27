//
//  ExerciseSheet.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct SheetTrigger: View {
    let title: String
    let count: String
    let action: () -> Void
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                HapticManager.instance.impact(style: .light)
                action()
            }
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.medium(16))
                        .foregroundStyle(Color.foreground)
                    Text(count)
                        .font(.medium(16))
                        .foregroundStyle(Color.gray)
                }
                Spacer()
            }
            .padding(16)
            .background(Color.sub)
            .clipShape(size: 12)
            .padding(.horizontal, 16)
        }
    }
}
