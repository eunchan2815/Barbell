//
//  TimerView.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct TimerView: View {
    @StateObject var viewModel = TimerViewModel()
    
    var body: some View {
        DefaultView("타이머") {
            ScrollView {
                VStack {
                    ZStack {
                        if viewModel.isDisplaySetTimeView {
                            settingView
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .bottom).combined(with: .opacity),
                                        removal: .opacity
                                    )
                                )
                        } else {
                            runningTimerView
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .top).combined(with: .opacity),
                                        removal: .opacity
                                    )
                                )
                        }
                    }
                    .animation(
                        .spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.25),
                        value: viewModel.isDisplaySetTimeView
                    )
                }
                .padding(16)
                .background(Color.sub)
                .clipShape(size: 12)
                .padding(.horizontal, 16)
            }
            Spacer()
        }
    }
    
    private var settingView: some View {
        VStack(spacing: 20) {
            
            HStack(spacing: 10) {
                Picker("Hour", selection: $viewModel.time.hours) {
                    ForEach(0..<24) { Text("\($0)시") }.font(.bold(20))
                }
                Picker("Minute", selection: $viewModel.time.minutes) {
                    ForEach(0..<60) { Text("\($0)분") }.font(.bold(20))
                }
                Picker("Second", selection: $viewModel.time.seconds) {
                    ForEach(0..<60) { Text("\($0)초") }.font(.bold(20))
                }
            }
            .labelsHidden()
            .pickerStyle(.wheel)
            .frame(height: 150)
            .opacity(0.95)
            
            TimerStart(
                isActive: true,
                iconName: "play"
            ) {
                withAnimation {
                    viewModel.settingBtnTapped()
                }
            }
            .padding(.vertical, 8)
            
            Text("타이머를 설정해주세요")
                .font(.medium(14))
                .foregroundStyle(.secondary)
        }
        .padding(.bottom, 30)
    }
    
    private var runningTimerView: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 30)
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.15), lineWidth: 12)
                    .frame(width: 250, height: 250)
                
                Circle()
                    .trim(from: 0.0, to: viewModel.progress)
                    .stroke(
                        Color.foreground,
                        style: StrokeStyle(lineWidth: 12, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 250, height: 250)
                    .animation(
                        .easeInOut(duration: 0.4),
                        value: viewModel.progress
                    )
                
                Text(viewModel.timeRemaining.formattedTimeString)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.foreground)
                    .monospacedDigit()
            }
            
            Text("경과 시간")
                .font(.medium(20))
                .foregroundStyle(Color.gray)
                .padding(.top)
            
            HStack {
                TimerStart(
                    isActive: false,
                    iconName: "arrowshape.turn.up.backward"
                ) {
                    withAnimation {
                        viewModel.cancelBtnTapped()
                    }
                }
                
                Spacer()
                
                TimerStart(
                    isActive: viewModel.isPaused == false,
                    iconName: viewModel.isPaused ? "play" : "stop"
                ) {
                    viewModel.pauseOrRestartBtnTapped()
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 60)
        }
    }
}

#Preview {
    TimerView()
}
