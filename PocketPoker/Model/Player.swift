//
//  Player.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import Foundation

class Player: ObservableObject {
    @Published var cards: [Card] = []
    
    func drawCard(card: Card) {
        self.cards.append(card)
        self.cards = self.cards.sorted(by: {$0.number.value > $1.number.value})
    }
    
    func setCards(cards: [Card]) {
        self.cards = cards
    }
    
    func resetCards() {
        self.cards = []
    }
}
