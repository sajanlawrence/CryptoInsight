//
//  Coin.swift
//  Crypto
//
//  Created by Sajan Lawrence on 26/09/25.
//

import Foundation
import SwiftUI

struct CoinDetail: Identifiable, Codable {
    let id, name, symbol: String
    let rank: Int?
    let isNew, isActive: Bool?
    let type: String?
    let logo: String?
    let team: [Team]?
    let description, message: String?
    let openSource, hardwareWallet: Bool?
    let startedAt: String?
    let orgStructure: String?
    let developmentStatus, proofType, hashAlgorithm: String?
    let links: Links?
    let linksExtended: [LinksExtended]?
    let firstDataAt: String?
    let lastDataAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank
        case isNew = "is_new"
        case isActive = "is_active"
        case type, logo, team, description, message
        case openSource = "open_source"
        case hardwareWallet = "hardware_wallet"
        case startedAt = "started_at"
        case developmentStatus = "development_status"
        case proofType = "proof_type"
        case orgStructure = "org_structure"
        case hashAlgorithm = "hash_algorithm"
        case links
        case linksExtended = "links_extended"
        case firstDataAt = "first_data_at"
        case lastDataAt = "last_data_at"
    }
    
    #if DEBUG
    static let `default` = CoinDetail(id: "btc-bitcoin", name: "Bitcoin", symbol: "BTC", rank: 1, isNew: false, isActive: true, type: "coin", logo: "https://static.coinpaprika.com/coin/bnb-binance-coin/logo.png", team: [Team(id: "vitalik-buterin", name: "Vitalik Buterin", position: "Author")], description: "Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator.", message: "<string>", openSource: true, hardwareWallet: true, startedAt: "2009-01-03T00:00:00Z", orgStructure: "Decentralized", developmentStatus: "Working product", proofType: "Proof of work", hashAlgorithm: "SHA256", links: Links(explorer: nil, facebook: nil, reddit: nil, sourceCode: nil, website: nil, youtube: nil, medium: nil), linksExtended: [LinksExtended(url: "http://blockchain.com/explorer", type: "explorer", stats: nil)], firstDataAt: "2018-10-03T11:48:19Z", lastDataAt: "2019-05-03T11:00:00")
    #endif
}


// MARK: - Links
struct Links: Codable {
    let explorer: [String]?
    let facebook, reddit, sourceCode, website: [String]?
    let youtube: [String]?
    let medium: [String]?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit
        case sourceCode = "source_code"
        case website, youtube, medium
    }
}

// MARK: - LinksExtended
struct LinksExtended: Codable {
    let url: String?
    let type: String?
    let stats: Stats?
}

// MARK: - Stats
struct Stats: Codable {
    let subscribers, contributors, stars: Int?
}

// MARK: - Tag
struct Tag: Codable {
    let id, name: String?
    let coinCounter, icoCounter: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case coinCounter = "coin_counter"
        case icoCounter = "ico_counter"
    }
}

// MARK: - Team
struct Team: Codable {
    let id, name, position: String?
}

// MARK: - Whitepaper
struct Whitepaper: Codable {
    let link: String?
    let thumbnail: String?
}
