import SwiftUI

struct ContentView: View {
    var body: some View {
        SilentModeOn()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SilentModeOn().preferredColorScheme(.dark)
    }
}

struct SilentModeOn: View {
    @State private var showing = true
    @State private var rotating = false
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .font(.title)
                .rotationEffect(.degrees(rotating ? 0 : -45), anchor: .top)
                .animation(
                    .spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0)
                    .repeatCount(1, autoreverses: true)
                    .delay(2.25), value: rotating)
            
            VStack {
                Text("Silent mode")
                Text("On")
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
        .background(Color(.systemGray4))
        .cornerRadius(32)
        .offset(y: showing ? -screenHeight / 1.8 : -screenHeight / 2.5)
        .onAppear {
            
            rotating.toggle()
            
            withAnimation(
                .spring()
                .repeatCount(1, autoreverses: true)
                .delay(2)) { showing.toggle() }
        }
    }
}
