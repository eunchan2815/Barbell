import SwiftUI

struct TimerStart: View {
    let isActive: Bool
    let iconName: String
    let action: () -> Void
    
    @State private var isTapped = false
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                isTapped = true
                action()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isTapped = false
            }
        } label: {
            Circle()
                .fill(Color.foreground)
                .frame(width: 58 , height: 58)
                .overlay {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.sub)
                        .scaleEffect(isTapped ? 0.8 : 1.0)
                }
        }
        .animation(.easeInOut(duration: 0.2), value: isTapped)
    }
}
