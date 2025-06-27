import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    @State private var showRatePicker = false
    @State private var showCountPicker = false
    
    var body: some View {
        DefaultView("카운트", false) {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack(spacing: 30) {
                            VStack {
                                Text("\(viewModel.currentCount)")
                                    .font(.bold(80))
                                    .foregroundStyle(Color.foreground)
                                
                                Text("/ \(viewModel.totalCount)")
                                    .font(.regular(20))
                                    .foregroundStyle(Color.gray)
                            }
                            
                            ExerciseProgressBar(viewModel.progress)
                                .padding(.horizontal, 10)
                            
                            ExerciseControlBar {
                                viewModel.startOrResume()
                            } pause: {
                                viewModel.stop()
                            } reset: {
                                viewModel.reset()
                            }
                            
                            Text("카운트를 시작했을경우 속도를\n조절하지 못해요 멈추고 설정해주세요")
                                .font(.medium(14))
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .padding(16)
                    .background(Color.sub)
                    .clipShape(size: 12)
                    .padding(.horizontal, 16)
                    
                    SheetTrigger(title: "목표 개수", count: "\(viewModel.totalCount)") {
                        withAnimation(.spring(duration: 0.1)) {
                            showCountPicker = true
                        }
                    }
                    
                    SheetTrigger(title: "속도", count: viewModel.rate.rateLabel) {
                        withAnimation(.spring(duration: 0.1)) {
                            showRatePicker = true
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
                
                if showRatePicker || showCountPicker {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showRatePicker = false
                            showCountPicker = false
                        }
                        .transition(.opacity)
                }
                
                CustomSheet(isPresented: $showRatePicker) {
                    RatePickerSheet(
                        selectedRate: $viewModel.rate,
                        rates: viewModel.rateMenu
                    ) {
                        showRatePicker = false
                    }
                }
                
                CustomSheet(isPresented: $showCountPicker) {
                    CountPickerSheet(
                        selectedCount: $viewModel.totalCount,
                        count: viewModel.countMenu
                    ) {
                        showCountPicker = false
                    }
                }
            }
        }
        .onTapGesture {
            showRatePicker = false
        }
        .onDisappear {
            viewModel.saveSettings()
        }
    }
}

#Preview {
    CounterView()
}
