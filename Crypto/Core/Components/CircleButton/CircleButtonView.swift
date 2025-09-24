//
//  CircleButton.swift
//  Crypto
//
//  Created by Sajan Lawrence on 24/09/25.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .foregroundStyle(Color.theme.accent)
            .font(.headline)
            .frame(width: 55, height: 55)
            .background {
                Circle()
                    .foregroundStyle(Color.theme.background)
            }
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "heart.fill")
}
