//
//  ContentView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView()
        }
        .padding()
    }
}

struct CardView: View {
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            base.foregroundColor(.white)
            base.stroke(lineWidth: 2)
            Text("🐼")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
