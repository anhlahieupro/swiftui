import SwiftUI

struct ContentView: View {
    var body: some View {
        SkeletonLoadingView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonLoadingView().preferredColorScheme(.dark)
    }
}

struct SkeletonLoadingView: View {
    @State private var shimmering = false
    private let streamSnow = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    private let streamGray = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
    
    var body: some View {
        VStack {
            ForEach(0..<6) { item in
                HStack {
                    Image(systemName: "square")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("Hello World")
                        Text("Hello")
                    }
                    .font(.title)
                }
                .redacted(reason: .placeholder)
                .foregroundStyle(
                    .linearGradient(
                        colors: [Color(streamSnow), Color(streamGray)],
                        startPoint: .leading,
                        endPoint: shimmering ? .trailing : .leading)
                )
            }
            .animation(.easeOut(duration: 2)
                .repeatForever(autoreverses: false), value: shimmering)
            .onAppear {
                shimmering.toggle()
            }
        }
    }
}
