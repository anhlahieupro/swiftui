//
//  ContentView.swift
//  swiftui-netflix
//
//  Created by hieudinh on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LottieView(filename: "swiftui-netflix")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
