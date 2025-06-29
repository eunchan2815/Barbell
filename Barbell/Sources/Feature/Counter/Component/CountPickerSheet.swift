//
//  CountPickerSheet.swift
//  Barbell
//
//  Created by 김은찬 on 6/26/25.
//

import SwiftUI

struct CountPickerSheet: View {
    @Binding var selectedCount: Int
    let count: [Int]
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Capsule()
                .frame(width: 40, height: 6)
                .foregroundColor(.gray.opacity(0.4))
                .padding(.top, 8)
                .padding(.bottom, 16)
            
            Text("속도를 설정해주세요")
                .font(.semiBold(16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
            
            ForEach(count, id: \.self) { rate in
                Button {
                    HapticManager.instance.impact(style: .light)
                    action()
                    selectedCount = rate
                } label: {
                    HStack {
                        Text("\(rate)개")
                            .font(.medium(16))
                            .foregroundStyle(Color.foreground)
                        Spacer()
                    }
                    .padding(12)
                    .background(rate == selectedCount ? Color.background : Color.clear)
                    .clipShape(size: 12)
                }
            }
        }
        .padding(16)
        .background(Color.sub)
        .clipShape(size: 12)
        .padding(.horizontal, 16)
    }
}
