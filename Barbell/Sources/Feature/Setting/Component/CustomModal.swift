//
//  CustomModal.swift
//  Barbell
//
//  Created by 김은찬 on 6/28/25.
//

import SwiftUI

struct CustomModal: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: NotificationViewModel
    @State private var selectedTime: Date = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Circle()
                .fill(.gray.opacity(0.15))
                .frame(width: 45, height: 45)
                .overlay {
                    Image(systemName: "bell")
                        .foregroundStyle(Color.foreground)
                }
            
            Text("알림 설정")
                .font(.bold(18))
                .foregroundStyle(Color.foreground)
            
            Text("알림이 울릴 시간을 설정해주세요")
                .font(.medium(16))
                .foregroundStyle(Color.gray)
            
            
            VStack(spacing: 20) {
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                    .environment(\.locale, Locale(identifier: "ko_KR"))
            }
            
            HStack {
                Button {
                    isPresented = false
                    viewModel.selectedTime = selectedTime
                    viewModel.isToggle = true
                    viewModel.saveNotificationSetting()
                } label: {
                    Text("저장")
                        .font(.bold(16))
                        .foregroundStyle(Color.background)
                        .padding(12)
                        .padding(.horizontal, 8)
                        .background(Color.foreground)
                        .clipShape(size: 12)
                }
                
                Button {
                    isPresented = false
                    viewModel.isToggle = false
                } label: {
                    Text("취소")
                        .font(.bold(16))
                        .foregroundStyle(Color.foreground)
                        .padding(12)
                        .padding(.horizontal, 8)
                        .background(Color.gray.opacity(0.2))
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
