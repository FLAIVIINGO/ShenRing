//
//  MultipleChoiceGameView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/10/25.
//

import SwiftUI

struct MultipleChoiceGameView: View {
    @ObservedObject var viewModel: MultipleChoiceGameViewModel
    
    var body: some View {
        VStack {
            cards
            Button(action: {
                let isCorrect = viewModel.checkAnswer()
                print(isCorrect ? "Correct!" : "Incorrect!")
            }, label: {
                Text("Check")
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(viewModel.selectedIndex != nil ? .blue : .gray)
            .disabled(viewModel.selectedIndex == nil)
        }
        .padding()
        .background(Color(.systemGray6))
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<viewModel.hieroglyphs.count, id: \.self) { index in
                CardView(
                    content: viewModel.hieroglyphs[index],
                    isSelected: Binding(
                        get: { viewModel.selectedIndex == index },
                        set: { isSelected in
                            if isSelected {
                                viewModel.selectCard(at: index)
                            }
                        }
                    )
                )
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                    .foregroundColor(isSelected ? .blue : .clear)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(isSelected ? .blue : .black)
            }
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    MultipleChoiceGameView(viewModel: MultipleChoiceGameViewModel(hieroglyphs: ["𓀀","𓁘","𓄃","𓂀"], correctIndex: 1))
}
