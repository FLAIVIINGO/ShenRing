//
//  UniliteralMultipleChoice.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/5/25.
//

import SwiftUI

class UniliteralMultipleChoice: ObservableObject {
    private var model: MultipleChoice
    
    @Published var selectedOption: String? = nil
    
    @Published var feedback: String = ""
    
    init() {
        let cards = MultipleChoice.fetchLocalCards()
        self.model = MultipleChoice(cards: cards)
    }
    
    var currentCard: MultipleChoice.Card {
        model.cards[0]
    }
    
    var options: [String] {
        currentCard.options
    }
    
    func checkAnswer(selectedOption: String) {
        if selectedOption == currentCard.meaning {
            feedback = "Correct! 🎉"
        } else {
            feedback = "Incorrect. The correct answer is \(currentCard.meaning)."
        }
    }
}
