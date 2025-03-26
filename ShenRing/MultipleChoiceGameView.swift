//
//  MultipleChoiceGameView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/10/25.
//

import SwiftUI

struct MultipleChoiceGameView: View {
    @ObservedObject var viewModel: UniliteralMultipleChoiceGame
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "xmark").font(.title).foregroundColor(.black)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "ellipsis").font(.title).foregroundColor(.black)
                })
            }
            Spacer()
            RoundedRectangle(cornerRadius: 12).fill(.gray).frame(height: 12)
            Spacer()
            Text("Which one of these is a pair of leaves?").font(.title2)
            cards
            Spacer()
            Button(action: {
                viewModel.showNotificationMessage()
            }, label: {
                Text("Check")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.bordered)
            .disabled(viewModel.isCheckEnabled ? false : true)
        }
        .padding()
        .overlay(
            Group {
                if viewModel.showNotification {
                    QuestionFeedbackView(text: "Correct!", status: true)
                }
            }
                .frame(maxHeight: .infinity, alignment: .bottom)
        )
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.black)
    }
}

struct CardView: View {
    let card: MultipleChoiceGame<String>.Card
    
    init(_ card: MultipleChoiceGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .foregroundColor(card.isSelected ? .blue : .black)
        }
    }
}

#Preview {
    MultipleChoiceGameView(viewModel: UniliteralMultipleChoiceGame())
}
