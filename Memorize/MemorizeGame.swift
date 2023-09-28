//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Robert Lutz on 9/28/23.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    
}
