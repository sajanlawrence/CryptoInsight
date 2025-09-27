//
//  MarketDetailsView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import SwiftUI

struct MarketDetailsView: View {
    let globalMarket: GlobalMarket
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Spacer()
            Text("Global Crypto Market Summary")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 200)
                .padding(.bottom, 0)
            VStack{
                Text("Last updated on: ")
                    .font(.subheadline)
                Text(getLastUpdatedDate())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ScrollableCardsView(item: globalMarket)
            Spacer()
        }
    }
    
    func getLastUpdatedDate() -> String{
        Date(timeIntervalSince1970: TimeInterval(globalMarket.lastUpdated)).formatted()
    }
}

#Preview {
    MarketDetailsView(globalMarket: .default)
}
