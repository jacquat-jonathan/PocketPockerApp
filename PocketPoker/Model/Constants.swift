//
//  Constants.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import Foundation

enum Turns {
    case Flop, Turn, River
}

enum Actions {
    case Call, Raise, Fold, Check
}

enum WinningHands {
    case High, Pair, TwoPairs, Three, Straight, Flush, FullHouse, Four, StraightFlush, RoyalFlush
}

struct Constants: Observable {
    let CARDS_COUNT = 52
    let CARDS_PER_PLAYER = 2
    let CARDS_PER_FLOP = 3
    let CARDS_PER_TURN = 1
    let CARDS_PER_RIVER = 1
    let MAX_CARDS_TO_USE = 5
}
