//
//  MultipleChoiceGame.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/10/25.
//

import Foundation

struct MultipleChoiceGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(cardContentList: [CardContent]) {
        cards = []
        
        for cardIndex in 0..<4 {
            let content = cardContentList[cardIndex]
            cards.append(Card(content: content, id: "\(cardIndex+1)"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            for index in cards.indices {
                cards[index].isSelected = (index == chosenIndex)
            }
        }
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isSelected = false
        var isMatched = false
        var content: CardContent
        var id: String
        var debugDescription: String {
            "\(id): \(isSelected ? "selected" : "not selected ") \(content) \(isMatched ? " matched" : ""))"
        }
    }
}


