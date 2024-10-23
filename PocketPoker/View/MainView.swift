//
//  MainView.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 20.10.2024.
//

import SwiftUI

struct MainView: View {

    @StateObject private var viewModel = MainViewViewModel()

    let constants = Constants()

    var body: some View {
        VStack {
            CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Clubs))
            CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Spades))
            CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Hearts))
            CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Diamonds))
        }
        
        Spacer()
        
        HStack {
            ForEach(viewModel.table) { card in
                DeckCardView(card: card, tableView: true)
            }
        }
        
        Spacer()
        
        VStack {
            HStack {
                ForEach(viewModel.player.cards) { card in
                    CardView(card: card, size: 25)
                }
            }
            
            Text(viewModel.getWinningHand())
            
            HStack {
                Button("Draw card") {
                    viewModel.drawCardsForPlayer()
                }
                .buttonStyle(BorderedButtonStyle())
                
                Button("Table draw") {
                    viewModel.drawTable()
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        }
    }
}

#Preview {
    MainView()
}
