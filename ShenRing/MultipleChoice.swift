//
//  MultipleChoice.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/4/25.
//

import Foundation

struct MultipleChoice<CardContent> {
    private(set) var cards: Array<Card>
    
    init(cardContentFactory: (Int) -> CardContent) {
        cards = []
        for i in 0..<4 {
            let content = cardContentFactory(i)
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isSelected = false
        var content: CardContent
    }
}
