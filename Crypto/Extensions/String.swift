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
    
    /// Returns a plain text string by removing all HTML tags
    func removingHTMLTags() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributedString.string
        }
        return self
    }
}
