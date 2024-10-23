//
//  Card.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import Foundation

enum CardColor: CaseIterable, Comparable {
    case Spades, Hearts, Diamonds, Clubs

    var name: String {
        switch self {
        case .Hearts: return "Heart"
        case .Diamonds: return "Diamond"
        case .Spades: return "Spade"
        case .Clubs: return "Club"
        }
    }
}

enum CardNumber: CaseIterable, Comparable {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen,
        King

    var number: String {
        switch self {
        case .Ace: return "A"
        case .Two: return "2"
        case .Three: return "3"
        case .Four: return "4"
        case .Five: return "5"
        case .Six: return "6"
        case .Seven: return "7"
        case .Eight: return "8"
        case .Nine: return "9"
        case .Ten: return "10"
        case .Jack: return "J"
        case .Queen: return "Q"
        case .King: return "K"
        }
    }
    
    var value: Int {
        switch self {
        case .Ace: return 14
        case .Two: return 2
        case .Three: return 3
        case .Four: return 4
        case .Five: return 5
        case .Six: return 6
        case .Seven: return 7
        case .Eight: return 8
        case .Nine: return 9
        case .Ten: return 10
        case .Jack: return 11
        case .Queen: return 12
        case .King: return 13
        }
    }
}

struct Card: Identifiable {
    let id = UUID()
    var color: CardColor
    var number: CardNumber
    var hasBeenDrawn: Bool = false
    var isShown: Bool = true
}
