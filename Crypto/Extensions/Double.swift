//
//  Double.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation

extension Double {
    /// Converts a number into a human-readable currency format (e.g. "$3.96 Tr")
    func formattedCurrencyString() -> String {
        let trillion = 1_000_000_000_000.0
        let billion = 1_000_000_000.0
        let million = 1_000_000.0
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        switch self {
        case trillion...:
            let value = self / trillion
            return "$\(formatter.string(from: NSNumber(value: value)) ?? "0")Tr"
        case billion...:
            let value = self / billion
            return "$\(formatter.string(from: NSNumber(value: value)) ?? "0")Bn"
        case million...:
            let value = self / million
            return "$\(formatter.string(from: NSNumber(value: value)) ?? "0")Mn"
        default:
            return "$\(formatter.string(from: NSNumber(value: self)) ?? "0")USD"
        }
    }
    
    /// Converts a number into a human-readable currency format (e.g. "$3.96 Trillion USD")
    func formattedFullCurrencyString() -> String {
            let trillion = 1_000_000_000_000.0
            let billion = 1_000_000_000.0
            let million = 1_000_000.0

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2

            switch self {
            case trillion...:
                let value = self / trillion
                return "$\(formatter.string(from: NSNumber(value: value)) ?? "0") Trillion USD"
            case billion...:
                let value = self / billion
                return "$\(formatter.string(from: NSNumber(value: value)) ?? "0") Billion USD"
            case million...:
                let value = self / million
                return "$\(formatter.string(from: NSNumber(value: value)) ?? "0") Million USD"
            default:
                return "$\(formatter.string(from: NSNumber(value: self)) ?? "0") USD"
            }
        }
    
    /// Converts a Double to a percentage string with 2 decimal places (e.g. "55.09%")
    func toPercentString() -> String {
        String(format: "%.2f%%", self)
    }
    
    /// Converts a Double to a percentage string with 2 decimal places (e.g. "55.09%")
    func toDoubleString() -> String {
        String(format: "%.2f", self)
    }
}
