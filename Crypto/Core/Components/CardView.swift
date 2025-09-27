//
//  CardView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import SwiftUI

struct CardView: View {
    let title: String
    let value: String

    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 0) {
                Text(title)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(value)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50, alignment: .center)
                    .background(Color.white.opacity(0.7))
                    .foregroundColor(.black)
            }
            .padding(.vertical, 0)
        }
        .cornerRadius(15)
        .frame(width: 300, height: 250)
        .shadow(color: .black, radius: 10, x: 0, y: 30)
        
    }
}

#Preview {
    CardView(title: "Total value of all cryptocurrencies in USD: $3.96 trillion USD", value: "$3.96 trillion USD")
}
