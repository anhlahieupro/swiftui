import SwiftUI

struct ContentView: View {
    var body: some View {
        Eyes()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Eyes().preferredColorScheme(.dark)
    }
}

struct Eyes: View {
    private var size: CGFloat = 120
    
    var body: some View {
        HStack {
            Eye(size: size).offset(x: -size / 10)
            Eye(size: size).offset(x: size / 10)
        }
    }
}

struct Eye: View {
    var size: CGFloat
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size)
                .foregroundColor(.gray)
                .offset(x: size / 15)
            
            Circle()
                .frame(width: size)
                .foregroundColor(.white)
            
            Circle()
                .frame(width: size / 3)
                .foregroundColor(.black)
                .offset(x: size / 4)
                .rotation3DEffect(.degrees(animate ? -360 : 0),
                                  axis: (x: 0, y: 0, z: 1))
                .animation(Animation
                    .easeOut(duration: 1.0)
                    .delay(0.2)
                    .repeatForever(autoreverses: false),
                           value: animate)
            
        }.onAppear() {
            animate.toggle()
        }
    }
}
