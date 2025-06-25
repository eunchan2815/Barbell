//
//  StepComponent.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct StepComponent: View {
    @StateObject private var viewModel = StepViewModel()
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("오늘의 걸음수")
                        .font(.bold(18))
                        .foregroundStyle(Color.foreground)
                    
                    Text("목표 10,000 걸음")
                        .font(.medium(14))
                        .foregroundStyle(.gray)
                }
                Spacer()
                
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundStyle(Color.foreground)
                    }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    if let stepCount = viewModel.stepCount {
                        Text("\(stepCount)")
                            .font(.bold(30))
                            .foregroundStyle(Color.foreground)
                    } else {
                        Text("불러올수 없어요!")
                            .font(.bold(24))
                            .foregroundStyle(Color.foreground)
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(.gray.opacity(0.2))
                                .frame(height: 8)
                                .clipShape(size: 3)
                            
                            Rectangle()
                                .fill(Color.foreground)
                                .frame(
                                    width: geometry.size.width * viewModel.completionPercentage,
                                    height: 8
                                )
                                .clipShape(size: 3)
                                .animation(.easeInOut(duration: 0.5), value: viewModel.completionPercentage)
                        }
                    }
                    .frame(height: 8)
                    
                    Text("\(viewModel.completionPercentageInt)% 완료")
                        .font(.medium(12))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(16)
        .background(Color.sub)
        .clipShape(size: 12)
        .padding(.horizontal, 16)
    }
}


