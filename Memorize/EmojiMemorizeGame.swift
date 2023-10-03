//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Robert Lutz on 9/28/23.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    @Published private var model: MemorizeGame<String>
    var collectionIndex: Int
    
    private let cardFaceCollective = [
       ["👻", "💀", "🎃", "😈", "😱", "👹", "☠️", "👽"],
       ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏓", "🎳", "🥊", "🥌", "🏂"],
       ["😷", "🚑", "🏥", "🚒", "🩻", "⚕️", "💊"]
       ]
        
    init(collectionIndex: Int) {
        self.collectionIndex = collectionIndex
        let emojis = cardFaceCollective[collectionIndex]
        self.model = MemorizeGame(numCardPairs: emojis.count) {pairIndex in emojis[pairIndex]}
    }

    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
    //MARK: - Intents
    
    func themeChooser(_ newIndex: Int) {
        self.collectionIndex = newIndex
        let emojis = cardFaceCollective[newIndex]
        self.model = MemorizeGame(numCardPairs: emojis.count) {pairIndex in emojis[pairIndex]}
        
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
}
