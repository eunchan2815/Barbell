import SwiftUI

struct DefaultView<Content: View>: View {
    let content: Content
    let pageName: String
    
    init(_ pageName: String, @ViewBuilder content: () -> Content) {
        self.pageName = pageName
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
                }
                .padding(.horizontal)
                content
            }
        }
    }
}
