//
//  CounterComponent.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct CounterComponent: View {
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                HStack {
                    Circle()
                        .fill(.gray.opacity(0.15))
                        .frame(width: 45, height: 45)
                        .overlay {
                            Image(systemName: "waveform.circle")
                                .foregroundStyle(Color.foreground)
                        }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("카운트")
                            .font(.bold(16))
                            .foregroundStyle(Color.foreground)
                        
                        Text("TSS 카운트로 운동하기")
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
