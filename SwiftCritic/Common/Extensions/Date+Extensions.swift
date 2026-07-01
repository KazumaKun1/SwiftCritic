//
//  Date+Extensions.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import Foundation

nonisolated extension Date {
    var relativeDisplay: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: .now)
    }
    
    static func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: .now)!
    }
}
