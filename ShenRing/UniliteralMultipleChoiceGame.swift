//
//  UniliteralMultipleChoiceGame.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/21/25.
//

import SwiftUI

class UniliteralMultipleChoiceGame: ObservableObject {
    private static let hieros = ["𓇌","𓃹","𓅦","𓆣"]
        
    var isCheckEnabled: Bool {
        model.cards.contains(where: { $0.isSelected })
    }
    
    var showNotification: Bool {
        model.showNotification
    }
    
    static func createMultipleChoiceGame() -> MultipleChoiceGame<String> {
        return MultipleChoiceGame(cardContentList: hieros)
    }
    
    @Published private var model = createMultipleChoiceGame()
    @Published private(set) var hasChecked = false
    
    var cards: Array<MultipleChoiceGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(_ card: MultipleChoiceGame<String>.Card) {
        model.choose(card)
    }
    
    func showNotificationMessage() {
        model.showNotificationMessage()
    }
    
    func checkAnswer() {
        hasChecked.toggle()
        model.checkAnswer()
    }
}
