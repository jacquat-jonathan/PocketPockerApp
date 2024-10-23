//
//  PokerTableView.swift
//  PocketPoker
//
//  Created by Jonathan Jacquat on 23.10.2024.
//

import SwiftUI

struct PokerTableView: View {
    
    @StateObject private var viewModel = PokerTableViewViewModel()
    
    var body: some View {
        VStack {
            /*
             VStack {
             CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Clubs))
             CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Spades))
             CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Hearts))
             CardLinePickerView(cards: viewModel.getColorTypeAllCard(color: CardColor.Diamonds))
             }
             
             Spacer()
             */
            
            HStack {
                ForEach(viewModel.table) { card in
                    DeckCardView(card: card, tableView: true)
                }
            }
            .padding(.bottom, 25)
            
            //Spacer()
            
            VStack {
                HStack {
                    ForEach(viewModel.player.cards) { card in
                        CardView(card: card, size: 25)
                    }
                }
                
                Text(viewModel.getWinningHand())
                
                HStack {
                    Button("Reset") {
                        viewModel.reset()
                    }
                    .buttonStyle(BorderedButtonStyle())
                    
                    Button("Next turn") {
                        viewModel.drawTable()
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                }
            }
        }
    }
}

#Preview {
    PokerTableView()
}
