//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Robert Lutz on 9/23/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorizeGame(collectionIndex: 0)
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game) }
    }
}
