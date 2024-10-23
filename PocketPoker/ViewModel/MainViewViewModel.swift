//
//  MainViewViewModel.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import Foundation

class MainViewViewModel: ObservableObject {

    @Published var deck: [Card] = []
    @Published var player: Player = Player()
    @Published var table: [Card] = []

    init() {
        setDeck()
        drawCardsForPlayer()
    }

    func setDeck() {
        var newDeck: [Card] = []
        let cardColors = CardColor.allCases
        let cardNumbers = CardNumber.allCases
        for color in cardColors {
            for number in cardNumbers {
                newDeck.append(Card(color: color, number: number))
            }
        }
        self.deck = newDeck
    }

    func getColorTypeAllCard(color: CardColor) -> [Card] {
        return self.deck.filter { $0.color == color }
    }

    func drawCardsForPlayer() {
        if player.cards.count > 0 {
            reset()
        }
        for _ in 0...1 {
            player.drawCard(card: drawRandomCard())
        }
    }

    func drawTable() {
        switch table.count {
        case 0...2:
            print("draw flop")
            drawFlop()
        case 3:
            print("draw turn")
            drawTurn()
        case 4:
            print("draw river")
            drawRiver()
        default:
            print("No more table draw")
        }
    }

    func drawFlop() {
        for _ in 1...3 {
            table.append(drawRandomCard())
        }
    }

    func drawTurn() {
        table.append(drawRandomCard())
    }

    func drawRiver() {
        table.append(drawRandomCard())
    }

    func drawRandomCard() -> Card {
        var hasDrawn = false
        var randomIndex = Int.random(in: 0..<deck.count)
        var drawnCard = deck[randomIndex]
        while !hasDrawn {
            if !drawnCard.hasBeenDrawn {
                drawnCard.hasBeenDrawn = true
                deck[randomIndex] = drawnCard
                hasDrawn = true
            }
            randomIndex = Int.random(in: 0..<deck.count)
            drawnCard = deck[randomIndex]
        }
        return drawnCard
    }
    
    func getWinningHand() -> String {
        let allDrawnCards = table + player.cards
        // Check pairs
        for card in allDrawnCards {
            if allDrawnCards.contains(where: {$0.number == card.number && $0.color != card.color }) {
                return "pairs";
            }
        }
        return "";
    }

    func reset() {
        setDeck()
        player.resetCards()
        self.table = []
    }
}
