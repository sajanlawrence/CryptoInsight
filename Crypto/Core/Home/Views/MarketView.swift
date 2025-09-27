//
//  MarketView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import SwiftUI

struct MarketView: View {
    let globalMarket: GlobalMarket
    var body: some View {
        VStack {
            HStack(alignment: .center){
                VStack{
                    Text("Market Cap")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(globalMarket.marketCapUsd.formattedCurrencyString())
                        .font(.headline)
                    
                }
                .padding()
                VStack{
                    Text("24h Volume")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(globalMarket.volume24HUsd.formattedCurrencyString())
                        .font(.headline)
                }
                .padding()
                VStack{
                    Text("BTC Dominance")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(globalMarket.bitcoinDominancePercentage.toPercentString())
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MarketView(globalMarket: .default)
}
