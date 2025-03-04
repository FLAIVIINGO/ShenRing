//
//  ContentView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    let hieros = ["𓃲","𓅋","𓆣","𓏢"]
    
    var body: some View {
        VStack {
            cards
        }
        .padding(16)
    }
    
    var cards: some View {
        LazyVGrid(
            columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
            ForEach(0..<4, id: \.self) { index in
                CardView(content: hieros[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    @State var isSelected = false
    let content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            base.foregroundColor(.white)
            base.stroke(lineWidth: 2)
                .foregroundColor(isSelected ? .blue : .black)
            Text(content)
                .font(.largeTitle)
                .foregroundColor(isSelected ? .blue : .black)
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    ContentView()
}
