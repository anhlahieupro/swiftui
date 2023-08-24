import SwiftUI

struct ContentView: View {
    var body: some View {
        Hello()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Hello()
    }
}

struct Hello: View {
    @State private var isBlinking = false
    @State private var isTilting = false
    @State private var isRaising = false
    @State private var isWaving = false
    @State private var isShouting = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    Image("body")
                    
                    HStack(spacing: 82) {
                        Image("rightHand")
                            .rotationEffect(.degrees(isWaving ? 0 : 90),
                                            anchor: .topTrailing)
                        
                        Image("leftHand")
                            .rotationEffect(.degrees(isWaving ? 0 : -10),
                                            anchor: .topLeading)
                            .animation(.easeInOut,
                                       value: isWaving)
                    }
                    
                    VStack {
                        Image("face")
                        Image("mouth")
                    }
                    
                    VStack(spacing: -12) {
                        HStack(spacing: 32) {
                            ZStack {
                                Image("eyelid")
                                Image("pipul")
                            }
                            
                            ZStack {
                                Image("eyelid")
                                Image("pipul")
                            }
                        }
                        .scaleEffect(y: isBlinking ? 1 : 0)
                        
                        VStack(spacing: -8) {
                            Image("nose")
                                .zIndex(1)
                            
                            Image("thoung")
                                .scaleEffect(x: isShouting ? 1.4 : 1)
                                .offset(y: isShouting ? -3: 4 )
                        }
                        .padding(.bottom)
                    }
                }
                .rotationEffect(.degrees(isTilting ? 0 : 15))
                
                HStack(spacing: 32) {
                    Image("legRight")
                        .rotationEffect(.degrees(isRaising ? 0 : -30),
                                        anchor: .bottomLeading)
                        .offset(x: isRaising ? 5 : 0)
                    
                    Image("legLeft")
                }
            }
            .onAppear{
                withAnimation(.easeOut(duration: 0.2)
                    .delay(0.25)
                    .repeatCount(2)) {
                        
                        isBlinking.toggle()
                    }
                
                withAnimation(.easeInOut(duration: 0.2)
                    .delay(0.5*4)
                    .repeatCount(1, autoreverses: true)) {
                        
                        isTilting.toggle()
                    }
                
                withAnimation(.easeOut(duration: 0.2)
                    .repeatCount(11, autoreverses: true)) {
                        
                        isWaving.toggle()
                    }
                
                withAnimation(.easeInOut(duration: 1)
                    .delay(0.5*3.4)
                    .repeatCount(1, autoreverses: true)) {
                        
                        isRaising.toggle()
                    }
                
                withAnimation(.easeInOut(duration: 1)
                    .delay(0.5*3.4)
                    .repeatCount(1, autoreverses: true)) {
                        
                        isShouting.toggle()
                    }
            }
            
            Image("floor")
        }
    }
}
