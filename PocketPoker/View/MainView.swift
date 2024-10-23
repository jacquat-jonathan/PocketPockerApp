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
        NavigationView {
            TabView {
                PokerTableView()
                    .tabItem {
                        Label("Play", systemImage: "playstation.logo")
                    }
                CardView(card: Card(color: CardColor.Spades, number: CardNumber.King), size: 12)
                    .tabItem {
                        Label("Deck", systemImage: "gear")
                    }
            }
        }
        
        
        
    }
}

#Preview {
    MainView()
}
