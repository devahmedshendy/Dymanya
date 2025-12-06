//
//  HasReleaseDate.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

protocol HasReleaseDate {
    var releaseDate: Date { get }
    var releaseDateDisplay: String { get }
}

extension HasReleaseDate {
    var releaseDateDisplay: String {
        let now = Date()
        let calendar = Calendar.current

        // 1. Check if it is Today
        if calendar.isDateInToday(releaseDate) {
            let components = calendar.dateComponents([.hour, .minute], from: releaseDate, to: now)

            if let hours = components.hour, hours > 0 {
                return "\(hours) hr ago"
            } else if let minutes = components.minute, minutes > 0 {
                return "\(minutes) min ago"
            } else {
                return "Just now"
            }
        }

        // 2. Check if it is Yesterday
        if calendar.isDateInYesterday(releaseDate) {
            return "Yesterday"
        }

        // 3. Check if it is within the last 7 days
        let daysAgo = calendar.dateComponents([.day], from: releaseDate, to: now).day ?? 0
        if daysAgo < 7 {
            return "\(daysAgo) days ago"
        }

        // 4. Fallback: Standard Date (e.g., "Oct 24, 2023")
        return releaseDate.formatted(date: .abbreviated, time: .omitted)
    }
}
