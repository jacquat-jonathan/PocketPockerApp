//
//  CardView.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import SwiftUI

struct DeckCardView: View {

    let card: Card
    let size: CGFloat = 12
    var tableView: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Text(card.number.number)
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.all, 15)
            
            switch card.color {
            case CardColor.Hearts:
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.red)
                    .padding(.top, -5)
                    .padding(.leading, 2)

            case CardColor.Diamonds:
                Image(systemName: "suit.diamond.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.red)
                    .padding(.top, -5)
                    .padding(.leading, 2)

            case CardColor.Spades:
                Image(systemName: "suit.spade.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.black)
                    .padding(.top, -5)
                    .padding(.leading, 2)

            case CardColor.Clubs:
                Image(systemName: "suit.club.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.black)
                    .padding(.top, -5)
                    .padding(.leading, 2)
            }
        }
        .frame(width: 50, height: 75)
        .background(!tableView && card.hasBeenDrawn ? .gray : .white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)  // Rounded border
                .stroke(Color.black, lineWidth: 1)  // Border color and thickness
        )
    }
}

#Preview {
    DeckCardView(
        card: Card(color: CardColor.Clubs, number: CardNumber.Ten))
}
