//
//  ExerciseProgressView.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct ExerciseProgressBar: View {
    let data: Double
    init(_ data: Double) {
        self.data = data
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(height: 8)
                    .clipShape(size: 3)
                
                Rectangle()
                    .fill(Color.foreground)
                    .frame(
                        width: geometry.size.width * data,
                        height: 8
                    )
                    .clipShape(size: 3)
                    .animation(.easeInOut(duration: 1.0), value: data)
            }
        }
        .frame(height: 8)
        
        Text("\(Int(data * 100))% 완료")
            .font(.medium(14))
            .foregroundStyle(.secondary)
    }
}
