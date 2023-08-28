import SwiftUI

struct ContentView: View {
    var body: some View {
        ReactionsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsView().preferredColorScheme(.dark)
    }
}

struct ReactionsView: View {
    @State private var showReaction = false
    private let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    private let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    
    private let like = "👍"
    private let love = "❤️"
    private let haha = "😂"
    private let sad = "😥"
    private let angry = "😡"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 60)
                .foregroundColor(Color(.systemGray6))
                .scaleEffect(CGFloat(showReaction ? 1 : 0), anchor: .topTrailing)
                .animation(.interpolatingSpring(stiffness: 170, damping: 15)
                    .delay(0.05), value: showReaction)
            
            HStack(spacing: 20) {
                Text(like)
                    .font(.title)
                    .offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8)
                        .delay(0.1), value: showReaction)
                
                Text(love)
                    .font(.title)
                    .offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                    .rotationEffect(.degrees(showReaction ? 0 : -45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8)
                        .delay(0.2), value: showReaction)
                
                Text(haha)
                    .font(.title)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .topTrailing)
                    .rotationEffect(.degrees(showReaction ? 0 : 45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8)
                        .delay(0.3), value: showReaction)
                
                Text(sad)
                    .font(.title)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8)
                        .delay(0.4), value: showReaction)
                
                Text(angry)
                    .font(.title)
                    .offset(x: showReaction ? 0 : 15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomTrailing)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8)
                        .delay(0.5), value: showReaction)
            }
        }
        .onAppear{
            showReaction.toggle()
        }
    }
}
