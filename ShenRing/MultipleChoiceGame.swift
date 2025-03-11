//
//  MultipleChoiceGame.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/10/25.
//

import Foundation

struct MultipleChoiceGame {
    let hieroglyphs: [String]
    let correctIndex: Int
    
    init(hieroglyphs: [String], correctIndex: Int) {
        self.hieroglyphs = hieroglyphs
        self.correctIndex = correctIndex
    }
    
    func isCorrect(selectedIndex: Int) -> Bool {
        return selectedIndex == correctIndex
    }
}
