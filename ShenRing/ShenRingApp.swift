//
//  ShenRingApp.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import SwiftUI

@main
struct ShenRingApp: App {
    var body: some Scene {
        WindowGroup {
            MultipleChoiceGameView(viewModel: MultipleChoiceGameViewModel(hieroglyphs: ["𓀀","𓁘","𓄃","𓂀"], correctIndex: 1))
        }
    }
}
