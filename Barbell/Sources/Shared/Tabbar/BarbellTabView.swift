//
//  TabView.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

struct BarbellTabView<Content: View>: View {
    @Binding var selection: TabItem
    let content: Content
    
    public init(
        selection: Binding<TabItem>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
                .foregroundStyle(Color.gray.opacity(0.15))
            
            Spacer(minLength: 2)
            
            VStack {
                HStack(spacing: 80) {
                    ForEach(TabItem.allCases, id: \.self) { tabItem in
                        BarbellTabBarItem(tabItem: tabItem, isSelected: tabItem == selection) {
                            selection = tabItem
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(Color.main)
            .ignoresSafeArea(edges: .bottom)
            .padding(.bottom, 15)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

