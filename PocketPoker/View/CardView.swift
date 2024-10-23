//
//  CardView.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    let size: CGFloat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if card.isShown {
                VStack {
                    Text(card.number.number)
                        .font(.system(size: size, weight: .bold))
                }
                .padding(.all, 15)
                
                switch card.color {
                case CardColor.Hearts:
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.red)
                        .padding(.top, -35)
                        .padding(.leading, -20)

                case CardColor.Diamonds:
                    Image(systemName: "suit.diamond.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.red)
                        .padding(.top, -35)
                        .padding(.leading, -20)

                case CardColor.Spades:
                    Image(systemName: "suit.spade.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.black)
                        .padding(.top, -35)
                        .padding(.leading, -20)

                case CardColor.Clubs:
                    Image(systemName: "suit.club.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.black)
                        .padding(.top, -35)
                        .padding(.leading, -20)
                }
            }
            
        }
        .frame(width: 80, height: 120)
        .padding()
        .background(card.isShown ? Color.white : Color.gray)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    CardView(card: Card(color: CardColor.Clubs, number: CardNumber.Ace), size: 25)
}
