//
//  AsyncImageView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 28/09/25.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL
    let defaultSystemImageName: String
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 150)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                
            case .failure:
                Image(systemName: defaultSystemImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    AsyncImageView(url: URL(string: "https://static.coinpaprika.com/coin/bnb-binance-coin/logo.png")!, defaultSystemImageName: "photo")
}
