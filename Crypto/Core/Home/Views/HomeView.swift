//
//  HomeView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortFolio: Bool = false
    @State private var animate: Bool = false
    @State private var searchTxtField = ""
    @State private var vm = HomeViewModel()
    @State private var selectedCoin: Coin? = nil
    @State private var showMoreMarketDetails: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                headerView
                MarketView(globalMarket: vm.globalMarket ?? .default)
                Button {
                    showMoreMarketDetails.toggle()
                } label: {
                    Text("Learn more")
                        .fontWeight(.regular)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(.buttonBorder)
                }
                searchBarView
                listHeaderView
                coinListView
                Spacer(minLength: 0)
            }
        }
        .navigationDestination(item: $selectedCoin, destination: { coin in
            CoinDetailView(coin: coin)
        })
        .onAppear {
            withAnimation(
                Animation
                    .easeIn(duration: 1.5)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
        .sheet(isPresented: $showMoreMarketDetails) {
            MarketDetailsView(globalMarket: vm.globalMarket ?? .default)
        }
    }
}

extension HomeView{
    private var headerView: some View{
        VStack(alignment: .center) {
            Text("Crypto Insight")
                .font(.largeTitle.bold())
                .padding(.horizontal, 25)
                .padding(.top, 20)
                .scaleEffect(animate ? 1 : 0.9)
                .foregroundStyle(.primary)
                .shadow(color: colorScheme == .dark ? Color.theme.red : .black.opacity(0.5), radius: 10)
            
            Text("All the crypto data you need in one place")
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var searchBarView: some View{
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search by name or symbol...", text: $searchTxtField)
            
        }
        .padding(18)
    }
    
    private var listHeaderView: some View{
        HStack{
            Text("Rank")
                .padding(.trailing, 20)
                .foregroundStyle(.secondary)
            HStack {
                Text("Symbol")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("Name")
                .foregroundStyle(.secondary)
        }
        .font(.headline)
        .padding(.horizontal, 25)
        .padding(.bottom, 12)
        .padding(.top, 12)
        .background(.gray.opacity(0.3))
    }
    
    private var coinListView: some View{
        List(selection: $selectedCoin){
            ForEach(vm.coins) { coin in
                CoinRowView(coin: coin)
                    .tag(coin)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeView()
}
