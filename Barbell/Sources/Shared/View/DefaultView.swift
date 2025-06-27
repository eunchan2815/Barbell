import SwiftUI

struct DefaultView<Content: View>: View {
    let content: Content
    let pageName: String
    let settingView: Bool
    
    init(_ pageName: String, _ settingView: Bool, @ViewBuilder content: () -> Content) {
        self.pageName = pageName
        self.settingView = settingView
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(pageName)
                        .font(.bold(30))
                        .foregroundStyle(Color.foreground)
                    Spacer()
                    if !settingView {
                        NavigationLink {
                            SettingView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.foreground)
                        }
                    }
                }
                .padding(.horizontal)
                content
            }
        }
    }
}
