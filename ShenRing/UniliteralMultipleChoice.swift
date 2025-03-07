//
//  UniliteralMultipleChoice.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/5/25.
//

import SwiftUI

class UniliteralMultipleChoice: ObservableObject {
    // The model (holds data and logic)
    private var model: MultipleChoice
    
    // Track user feedback (e.g., "Correct!" or "Incorrect!")
    @Published var feedback: String = ""
    
    // Initialize the ViewModel
    init() {
        // Fetch cards from the model
        let cards = MultipleChoice.fetchLocalCards()
        self.model = MultipleChoice(cards: cards)
    }
    
    // Get the current card
    var currentCard: MultipleChoice.Card {
        model.cards[0] // Always show the first card for testing
    }
    
    // Get the options for the current card
    var options: [String] {
        currentCard.options
    }
    
    // Process user intent (e.g., checking an answer)
    func checkAnswer(selectedOption: String) {
        if selectedOption == currentCard.meaning {
            feedback = "Correct! 🎉"
        } else {
            feedback = "Incorrect. The correct answer is \(currentCard.meaning)."
        }
    }
}
