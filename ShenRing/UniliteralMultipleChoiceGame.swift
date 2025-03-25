//
//  UniliteralMultipleChoiceGame.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/21/25.
//

import SwiftUI

class UniliteralMultipleChoiceGame: ObservableObject {
    private static let hieros = ["𓇌","𓃹","𓅦","𓆣"]
    
    private(set) var selectedCard: MultipleChoiceGame<String>.Card?
    
    var isCheckEnabled: Bool {
        selectedCard != nil
    }
    
    static func createMultipleChoiceGame() -> MultipleChoiceGame<String> {
        return MultipleChoiceGame(cardContentList: hieros)
    }
    
    @Published private var model = createMultipleChoiceGame()
    
    var cards: Array<MultipleChoiceGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(_ card: MultipleChoiceGame<String>.Card) {
        selectedCard = card
        model.choose(card)
    }
}
