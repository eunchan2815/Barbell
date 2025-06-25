//
//  StepComponent.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import Shimmer
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
                    .frame(width: 40, height: 40)
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
                        Text("불러오는 중이에요!")
                            .font(.bold(30))
                            .foregroundStyle(Color.foreground)
                            .redacted(reason: .placeholder)
                            .shimmering()
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    ExerciseProgressBar(viewModel.completionPercentage)
                }
            }
        }
        .padding(16)
        .background(Color.sub)
        .clipShape(size: 12)
        .padding(.horizontal, 16)
    }
}


