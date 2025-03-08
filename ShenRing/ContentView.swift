//
//  ContentView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UniliteralMultipleChoice()
    
    var body: some View {
        VStack {
            // Display the current hieroglyph
            Text(viewModel.currentCard.hieroglyph)
                .font(.system(size: 100))
                .padding()
            
            // Display the options in a grid
            optionsGrid
            
            // Display feedback
            Text("hello")
                .font(.headline)
                .padding()
        }
        .padding(16)
    }
    
    // Grid layout for options
    var optionsGrid: some View {
        LazyVGrid(
            columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)],
            spacing: 16
        ) {
            ForEach(viewModel.options, id: \.self) { option in
                CardView(isSelected: false, content: option)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.checkAnswer(selectedOption: option)
                    }
            }
        }
    }
}

// CardView for displaying options
struct CardView: View {
    @State var isSelected: Bool
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
