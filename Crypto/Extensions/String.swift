//
//  String.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation
import UIKit

extension String{
    /// Converts an ISO8601 date string (e.g. "2022-12-03T07:55:00Z") to a readable date format
    func toFormattedDate(outputFormat: String = "MMM d, yyyy 'at' h:mm a") -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let fallbackFormatter = ISO8601DateFormatter()
        
        let date = isoFormatter.date(from: self) ?? fallbackFormatter.date(from: self)
        
        guard let date = date else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateFormat = outputFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        
        return formatter.string(from: date)
    }
    
    var strippedHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
