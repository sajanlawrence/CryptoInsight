//
//  CoinsModel.swift
//  Crypto
//
//  Created by Sajan Lawrence on 26/09/25.
//

import Foundation

struct Coin: Identifiable, Codable, Hashable {
    let id, name, symbol: String
    let rank: Int
    let isNew, isActive: Bool
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank
        case isNew = "is_new"
        case isActive = "is_active"
        case type
    }
    
    #if DEBUG
    static let `default` = Coin(id: "btc-bitcoin", name: "Bitcoin", symbol: "BTC", rank: 1, isNew: false, isActive: true, type: "coin")
    #endif
}
