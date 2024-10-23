//
//  CardLinePickerView.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 21.10.2024.
//

import SwiftUI

struct CardLinePickerView: View {

    let cards: [Card]
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cards) { card in
                        DeckCardView(card: card)
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.horizontal)
        }
        .background(.white)
    }
}

#Preview {
    CardLinePickerView(cards: [
        Card(color: CardColor.Clubs, number: CardNumber.Ace),
        Card(color: CardColor.Clubs, number: CardNumber.Ace),
        Card(color: CardColor.Clubs, number: CardNumber.Ace),
    ])
}
