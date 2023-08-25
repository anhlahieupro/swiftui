import SwiftUI

struct ContentView: View {
    var body: some View {
        SlideToPowerOff()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlideToPowerOff()
    }
}

struct SlideToPowerOff: View {
    @State private var isShimmering = false
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "power.circle.fill")
                    .font(.system(size: 50))
                
                Text("**Slide to power off**")
                    .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.black, .white]),
                        startPoint: .leading,
                        endPoint: isShimmering ? .trailing : .leading))
                
                    .animation(.easeInOut(duration: 2)
                        .repeatForever(autoreverses: false),
                               value: isShimmering)
                
                    .onAppear {
                        isShimmering.toggle()
                    }
            }
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.purple)
    }
}
