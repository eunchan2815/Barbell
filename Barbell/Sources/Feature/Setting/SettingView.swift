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
                    BellButton($viewModel.isToggle) {
                        showCustomPopup = true
                    }
                    ThemeButton()
                    SettingItemButton(
                        imageName: "Notion",
                        title: "도움말",
                        description: "Notion 페이지로 이동"
                    ) {
                        showNotion = true
                    }
                    SettingItemButton(
                        imageName: "Github",
                        title: "개발자",
                        description: "GitHub 프로필 보기"
                    ) {
                        showGithub = true
                    }
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
                }
            }
            .animation(.easeInOut(duration: 0.25), value: showCustomPopup)
        }
        .sheet(isPresented: $showNotion) {
            FlexibleWebView(url: "https://www.notion.so/Barbell-21dcba4137ad80a78e6ece05986587b1?source=copy_link")
        }
        .sheet(isPresented: $showGithub) {
            FlexibleWebView(url: "https://github.com/eunchan2815")
        }
        .BarbellBackButton()
    }
}

#Preview {
    SettingView()
}
