//
//  SettingView.swift
//  Barbell
//
//  Created by 김은찬 on 6/27/25.
//

import SwiftUI
import FlexibleKit

struct SettingView: View {
    @StateObject private var viewModel = NotificationViewModel()
    @State private var showCustomPopup = false
    @State private var showNotion = false
    @State private var showGithub = false
    
    var body: some View {
        DefaultView("설정", true) {
            ZStack {
                ScrollView(showsIndicators: false) {
                    BellButton(
                        isToggle: $viewModel.isToggle,
                        text: viewModel.formattedTime
                    ) {
                        showCustomPopup = true
                    }
                    ThemeButton()
                    SettingItemButton(
                        url: "https://www.notion.so/Barbell-21dcba4137ad80a78e6ece05986587b1?source=copy_link",
                        imageName: "Notion",
                        title: "도움말",
                        description: "Notion 페이지로 이동"
                    )
                    SettingItemButton(
                        url: "https://github.com/eunchan2815",
                        imageName: "Github",
                        title: "개발자",
                        description: "GitHub 프로필 보기"
                    )
                    Spacer().frame(height: 60)
                    
                    Text("버전 1.0.0")
                        .font(.medium(14))
                        .foregroundStyle(.secondary)
                }
                Spacer()
                
                if showCustomPopup {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showCustomPopup = false
                                viewModel.isToggle = false
                            }
                        }
                        .zIndex(1)
                }
                
                if showCustomPopup {
                    CustomModal(
                        isPresented: $showCustomPopup,
                        viewModel: viewModel
                    )
                    .transition(.scale(scale: 0.9).combined(with: .opacity))
                    .zIndex(2)
                    .padding(.bottom, 20)
                }
            }
            .animation(.easeInOut(duration: 0.25), value: showCustomPopup)
        }
        .BarbellBackButton()
    }
}

#Preview {
    SettingView()
}
