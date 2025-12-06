//
//  HasDuration.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

protocol HasDuration {
    var duration: Int { get }
    var durationDisplay: String { get }
}

extension HasDuration {
    var durationDisplay: String {
        let hours = Int(self.duration) / 3600
        let minutes = (Int(self.duration) % 3600) / 60

        if hours > 0 {
            return minutes > 0
            ? .init("\(hours) hr \(minutes) min")
            : .init("\(hours) hr")
        } else {
            return minutes > 0
            ? .init("\(minutes) min")
            : ""
        }
    }
}
