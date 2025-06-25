//
//  CounterView.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    var body: some View {
        DefaultView("카운트") {
            VStack {
                VStack(spacing: 30) {
                    VStack {
                        Text("\(viewModel.currentCount)")
                            .font(.bold(80))
                            .foregroundStyle(Color.foreground)
                        
                        Text("\(viewModel.currentCount)/ \(viewModel.totalCount)")
                            .font(.regular(20))
                            .foregroundStyle(Color.gray)
                    }
                    
                    ExerciseProgressBar(viewModel.progress)
                        .padding(.horizontal, 10)
                    
                    ExerciseControlBar {
                        viewModel.starting()
                    } pause: {
                        viewModel.stop()
                    } reset: {
                        viewModel.reset()
                    }
                }
            }
            .padding(16)
            .background(Color.sub)
            .clipShape(size: 12)
            .padding(.horizontal, 16)
            Spacer()
        }
    }
}

#Preview {
    CounterView()
}
