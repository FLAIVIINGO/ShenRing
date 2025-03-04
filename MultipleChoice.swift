//
//  MultipleChoice.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import Foundation

struct MultipleChoice<CardContent> {
    
    struct Card {
        var isSelected: Bool = false
        var isMatched: Bool
        var content: CardContent
    }
}
