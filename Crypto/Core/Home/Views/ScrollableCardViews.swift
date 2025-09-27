//
//  ScrollableCardViews.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import SwiftUI

struct ScrollableCardsView: View {
    let item: GlobalMarket
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 20) {
                CardView(title: "The total market capitalization (i.e. total value) of all cryptocurrencies in USD", value: item.marketCapUsd.formattedFullCurrencyString())
                CardView(title: "The total trading volume of all cryptocurrencies over the last 24 hours, in USD", value: item.volume24HUsd.formattedFullCurrencyString())
                CardView(title: "Bitcoin’s percentage share of the total crypto market cap", value: item.bitcoinDominancePercentage.toPercentString())
                CardView(title: "The total number of listed cryptocurrencies tracked by the platform", value: "\(item.cryptocurrenciesNumber)")
                CardView(title: "The all-time high (ATH) value of total market capitalization (in USD)", value: item.marketCapAthValue.formattedFullCurrencyString())
                CardView(title: "The date and time when the market cap ATH occurred", value: item.marketCapAthDate)
                CardView(title: "The highest 24-hour trading volume ever recorded, in USD", value: item.volume24HAthValue.formattedFullCurrencyString())
                CardView(title: "The date when ATH 24h volume occurred", value: item.volume24HAthDate)
                CardView(title: "How much the current volume is down (%) from ATH", value: item.volume24HPercentFromAth.toPercentString())
                CardView(title: "How much the current volume must grow (%) to reach ATH", value: item.volume24HPercentToAth.toPercentString())
                CardView(title: "Percentage change in market cap over the last 24 hours", value: item.marketCapChange24H.toPercentString())
                CardView(title: "Percentage change in 24h trading volume compared to yesterday", value: item.volume24HChange24H.toPercentString())
                
            }
            .padding()
            .frame(maxHeight: 400)
        }
    }
}

#Preview {
    ScrollableCardsView(item: .default)
}
