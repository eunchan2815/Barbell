//
//  TimerComponent.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct TimerComponent: View {
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
                            Image(systemName: "timer")
                                .foregroundStyle(Color.foreground)
                        }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("타이머")
                            .font(.bold(16))
                            .foregroundStyle(Color.foreground)
                        
                        Text("타이머로 운동 시간 재기")
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
