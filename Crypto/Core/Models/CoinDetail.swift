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
    let parent: Parent
    let rank: Int
    let isNew, isActive: Bool
    let type: String
    let logo: String
    let tags: [Tag]
    let team: [Team]
    let description, message: String
    let openSource, hardwareWallet: Bool
    let startedAt: String
    let developmentStatus, proofType, orgStructure, hashAlgorithm: String
    let contract, platform: String
    let contracts: [Contract]
    let links: Links
    let linksExtended: [LinksExtended]
    let whitepaper: Whitepaper
    let firstDataAt: String
    let lastDataAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, parent, rank
        case isNew = "is_new"
        case isActive = "is_active"
        case type, logo, tags, team, description, message
        case openSource = "open_source"
        case hardwareWallet = "hardware_wallet"
        case startedAt = "started_at"
        case developmentStatus = "development_status"
        case proofType = "proof_type"
        case orgStructure = "org_structure"
        case hashAlgorithm = "hash_algorithm"
        case contract, platform, contracts, links
        case linksExtended = "links_extended"
        case whitepaper
        case firstDataAt = "first_data_at"
        case lastDataAt = "last_data_at"
    }
    
    #if DEBUG
    static let `default` = CoinDetail(id: "btc-bitcoin", name: "Bitcoin", symbol: "BTC", parent: Parent(id: "eth-ethereum", name: "Ethereum", symbol: "ETH"), rank: 1, isNew: false, isActive: true, type: "coin", logo: "https://static.coinpaprika.com/coin/bnb-binance-coin/logo.png", tags: [Tag(id: "blockchain-service", name: "Blockchain Service", coinCounter: 160, icoCounter: 80)], team: [Team(id: "vitalik-buterin", name: "Vitalik Buterin", position: "Author")], description: "Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator.", message: "<string>", openSource: true, hardwareWallet: true, startedAt: "2009-01-03T00:00:00Z", developmentStatus: "Working product", proofType: "Proof of work", orgStructure: "Decentralized", hashAlgorithm: "SHA256", contract: "<string>", platform: "<string>", contracts: [Contract(contract: "<string>", platform: "<string>", type: "<string>")], links: Links(explorer: nil, facebook: nil, reddit: nil, sourceCode: nil, website: nil, youtube: nil, medium: nil), linksExtended: [LinksExtended(url: "http://blockchain.com/explorer", type: "explorer", stats: nil)], whitepaper: Whitepaper(link: "https://static.coinpaprika.com/storage/cdn/whitepapers/215.pdf", thumbnail: "https://static.coinpaprika.com/storage/cdn/whitepapers/217.jpg"), firstDataAt: "2018-10-03T11:48:19Z", lastDataAt: "2019-05-03T11:00:00")
    #endif
}

// MARK: - Contract
struct Contract: Codable {
    let contract, platform, type: String
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
    let url: String
    let type: String
    let stats: Stats?
}

// MARK: - Stats
struct Stats: Codable {
    let subscribers, contributors, stars: Int?
}

// MARK: - Parent
struct Parent: Codable {
    let id, name, symbol: String
}

// MARK: - Tag
struct Tag: Codable {
    let id, name: String
    let coinCounter, icoCounter: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case coinCounter = "coin_counter"
        case icoCounter = "ico_counter"
    }
}

// MARK: - Team
struct Team: Codable {
    let id, name, position: String
}

// MARK: - Whitepaper
struct Whitepaper: Codable {
    let link: String
    let thumbnail: String
}
