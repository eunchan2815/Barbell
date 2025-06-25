//
//  ExerciseSheet.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct ExerciseSheet: View {
    let title: String
    let count: Int
    let action: () -> Void
    var body: some View {
        Button {
            
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.medium(16))
                        .foregroundStyle(Color.foreground)
                    Text("\(count)")
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
