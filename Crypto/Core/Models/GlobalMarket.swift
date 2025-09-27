//
//  GlobalMarket.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation

struct GlobalMarket: Codable, Hashable{
    let id = UUID()
    let marketCapUsd, volume24HUsd: Double
    let bitcoinDominancePercentage: Double
    let cryptocurrenciesNumber: Int
    let marketCapAthValue: Double
    let marketCapAthDate: String
    let volume24HAthValue: Double
    let volume24HAthDate: String
    let volume24HPercentFromAth, volume24HPercentToAth, marketCapChange24H, volume24HChange24H: Double
    let lastUpdated: Int
    
    enum CodingKeys: String, CodingKey {
        case marketCapUsd = "market_cap_usd"
        case volume24HUsd = "volume_24h_usd"
        case bitcoinDominancePercentage = "bitcoin_dominance_percentage"
        case cryptocurrenciesNumber = "cryptocurrencies_number"
        case marketCapAthValue = "market_cap_ath_value"
        case marketCapAthDate = "market_cap_ath_date"
        case volume24HAthValue = "volume_24h_ath_value"
        case volume24HAthDate = "volume_24h_ath_date"
        case volume24HPercentFromAth = "volume_24h_percent_from_ath"
        case volume24HPercentToAth = "volume_24h_percent_to_ath"
        case marketCapChange24H = "market_cap_change_24h"
        case volume24HChange24H = "volume_24h_change_24h"
        case lastUpdated = "last_updated"
    }
    
    #if DEBUG
    static let `default` = GlobalMarket(marketCapUsd: 0.0, volume24HUsd: 0.0, bitcoinDominancePercentage: 0.00, cryptocurrenciesNumber: 13963, marketCapAthValue: 4820532858002, marketCapAthDate: "2025-07-31T00:50:00Z", volume24HAthValue: 16460384024873, volume24HAthDate: "2022-12-03T07:55:00Z", volume24HPercentFromAth: -98.32, volume24HPercentToAth: 5860.5, marketCapChange24H: 0.74, volume24HChange24H: -21.14, lastUpdated: 1758954984)
    #endif
}
