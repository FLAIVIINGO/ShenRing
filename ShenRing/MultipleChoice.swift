//
//  MultipleChoice.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/4/25.
//

import Foundation

struct MultipleChoice {
    private(set) var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    static func fetchLocalCards() -> [Card] {
            return [
                Card(
                    id: 1,
                    hieroglyph: "𓃭",
                    meaning: "lion",
                    options: ["lion", "cat", "dog", "bird"]
                ),
                Card(
                    id: 2,
                    hieroglyph: "𓆣",
                    meaning: "scarab",
                    options: ["scarab", "beetle", "fly", "ant"]
                ),
                Card(
                    id: 3,
                    hieroglyph: "𓂀",
                    meaning: "eye",
                    options: ["eye", "hand", "foot", "mouth"]
                )
            ]
        }
    
    struct Card {
        let id: Int
        let hieroglyph: String
        let meaning: String
        let options: [String]
    }
}
