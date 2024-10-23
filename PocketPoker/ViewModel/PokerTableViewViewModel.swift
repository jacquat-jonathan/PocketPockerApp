//
//  MainViewViewModel.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import Foundation

class PokerTableViewViewModel: ObservableObject {

    @Published var deck: [Card] = []
    @Published var player: Player = Player()
    @Published var table: [Card] = []
    var flopDrawn: Bool = false
    var turnDrawn: Bool = false
    var riverDrawn: Bool = false

    init() {
        setDeck()
        setTable()
        drawCardsForPlayer()
    }

    func setTable() {
        self.table = [
            Card(
                color: CardColor.Spades, number: CardNumber.Ace, isShown: false),
            Card(
                color: CardColor.Spades, number: CardNumber.Ace, isShown: false),
            Card(
                color: CardColor.Spades, number: CardNumber.Ace, isShown: false),
            Card(
                color: CardColor.Spades, number: CardNumber.Ace, isShown: false),
            Card(
                color: CardColor.Spades, number: CardNumber.Ace, isShown: false),
        ]
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
        player.resetCards()
        for _ in 1...2 {
            player.drawCard(card: drawRandomCard())
        }
    }

    func drawTable() {
        if !flopDrawn {
            drawFlop()
        } else if !turnDrawn {
            drawTurn()
        } else if !riverDrawn {
            drawRiver()
        } else {
            print("No more table draw")
        }
    }

    func drawFlop() {
        for i in 1...3 {
            table.insert(drawRandomCard(), at: i - 1)
            table.remove(at: i)
        }
        flopDrawn = true
    }

    func drawTurn() {
        table.insert(drawRandomCard(), at: 3)
        table.remove(at: 4)
        turnDrawn = true
    }

    func drawRiver() {
        table.insert(drawRandomCard(), at: 4)
        table.remove(at: 5)
        riverDrawn = true
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
            if allDrawnCards.contains(where: {
                $0.number == card.number && $0.color != card.color
            }) {
                return "pairs"
            }
        }
        return ""
    }

    func resetTurns() {
        flopDrawn = false
        turnDrawn = false
        riverDrawn = false
    }

    func reset() {
        setDeck()
        setTable()
        resetTurns()
        drawCardsForPlayer()
    }
}
