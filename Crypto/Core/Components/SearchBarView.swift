//
//  SearchBarView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 28/09/25.
//

import SwiftUI

struct SearchBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var searchTxtField: String
    @FocusState private var isSearchFieldFocused: Bool
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search by name or symbol...", text: $searchTxtField)
                .autocorrectionDisabled()
                .focused($isSearchFieldFocused)
            
            if !searchTxtField.isEmpty{
                Image(systemName: "xmark.circle.fill")
                    .padding(.horizontal)
                    .offset(x: 13)
                    .onTapGesture {
                        searchTxtField = ""
                        isSearchFieldFocused = false
                    }
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.08))
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchTxtField: .constant(""))
}
