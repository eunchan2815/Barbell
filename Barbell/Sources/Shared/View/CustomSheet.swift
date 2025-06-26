//
//  Test.swift
//  Barbell
//
//  Created by 김은찬 on 6/26/25.
//

import SwiftUI

struct CustomSheet<Content: View>: View {
    let content: Content
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }
    
    var body: some View {
        if isPresented {
            VStack {
                Spacer()
                content
                    .padding(.bottom, 20)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom).combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    ))
            }
            .animation(.interpolatingSpring(
                mass: 0.1,
                stiffness: 600,
                damping: 10,
                initialVelocity: 25
            ), value: isPresented)
        }
    }
}

