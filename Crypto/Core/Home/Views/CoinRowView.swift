//
//  CoinRowView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 26/09/25.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack(spacing: 10){
            Text("#\(coin.rank)")
                .bold()
                .frame(width: 60)
            Text(coin.symbol)
                .bold()
                .multilineTextAlignment(.center)
                .frame(minWidth: 80)
            Spacer()
            Text(coin.name)
                .bold()
                .multilineTextAlignment(.trailing)
                .frame(minWidth: 100, alignment: .trailing)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
        .background(.thickMaterial)
    }
}

#Preview {
    CoinRowView(coin: .default)
}

#Preview {
    CoinRowView(coin: .default)
        .preferredColorScheme(.dark)
}
