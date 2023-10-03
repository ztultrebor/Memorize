//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Robert Lutz on 9/28/23.
//

import Foundation

struct MemorizeGame<CardContent> {
    private(set) var cards: [Card]
    
    init(numCardPairs: Int, cardGenerator: (Int)->CardContent) {
        cards = []
        for pairsIndex in 0..<max(2, numCardPairs) {
            cards.append(Card(content: cardGenerator(pairsIndex)))
            cards.append(Card(content: cardGenerator(pairsIndex)))
        }
        cards.shuffle()
    }
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
    
    func choose(_ card: Card) {
//        card.isFaceUp.toggle()
    }
    
    
}
