//
//  ShenRingApp.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/2/25.
//

import SwiftUI

@main
struct ShenRingApp: App {
    @StateObject var game = UniliteralMultipleChoiceGame()
    var body: some Scene {
        WindowGroup {
            MultipleChoiceGameView(viewModel: game)
        }
    }
}
