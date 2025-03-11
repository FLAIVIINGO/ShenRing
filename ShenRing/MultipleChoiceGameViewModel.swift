//
//  MultipleChoiceGameViewModel.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/10/25.
//

import SwiftUI

class MultipleChoiceGameViewModel: ObservableObject {
    @Published private var model: MultipleChoiceGame
    @Published var selectedIndex: Int? = nil
    
    init(hieroglyphs: [String], correctIndex: Int) {
        self.model = MultipleChoiceGame(hieroglyphs: hieroglyphs, correctIndex: correctIndex)
    }
    
    var hieroglyphs: [String] {
        return model.hieroglyphs
    }
    
    func selectCard(at index: Int) {
        if selectedIndex == index {
            selectedIndex = nil
        } else {
            selectedIndex = index
        }
    }
    
    func checkAnswer() -> Bool {
        guard let selectedIndex = selectedIndex else { return false }
        return model.isCorrect(selectedIndex: selectedIndex)
    }
}
