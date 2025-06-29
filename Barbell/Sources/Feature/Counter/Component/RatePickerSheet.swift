//
//  RatePickerSheet.swift
//  Barbell
//
//  Created by 김은찬 on 6/26/25.
//

import SwiftUI

struct RatePickerSheet: View {
    @Binding var selectedRate: RateMenu
    let rates: [RateMenu]
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
            
            ForEach(rates, id: \.id) { rate in
                Button {
                    HapticManager.instance.impact(style: .light)
                    selectedRate = rate
                    action()
                } label: {
                    HStack {
                        Text(rate.rateLabel)
                            .font(.medium(16))
                            .foregroundStyle(Color.foreground)
                        Spacer()
                    }
                    .padding(12)
                    .background(rate == selectedRate ? Color.background : Color.clear)
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
