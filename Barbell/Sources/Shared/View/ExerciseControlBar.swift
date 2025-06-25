//
//  ExerciseControlBar.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct ExerciseControlBar: View {
    @State private var isStart = false
    @State private var animateTap = false
    
    let start: () -> Void
    let pause: () -> Void
    let reset: () -> Void
    
    var body: some View {
        HStack(spacing: 24) {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    isStart.toggle()
                    animateTap = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    animateTap = false
                }
                
                isStart ? start() : pause()
            } label: {
                Circle()
                    .fill(Color.foreground)
                    .frame(width: animateTap ? 58 : 65, height: animateTap ? 58 : 65)
                    .overlay {
                        Image(systemName: isStart ? "stop" : "play")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.sub)
                            .scaleEffect(animateTap ? 0.8 : 1.0)
                    }
                    .shadow(color: .black.opacity(0.15), radius: isStart ? 8 : 4, x: 0, y: 3)
            }
            
            Button {
                reset()
            } label: {
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 65, height: 65)
                    .overlay {
                        Image(systemName: "arrow.counterclockwise")
                            .resizable()
                            .frame(width: 19, height: 24)
                            .foregroundStyle(Color.foreground)
                    }
            }
        }
        .animation(.easeInOut(duration: 0.2), value: animateTap)
    }
}
