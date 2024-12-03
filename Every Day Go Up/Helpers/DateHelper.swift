//
//  DateHelper.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/2.
//

import Foundation

extension Date {
    /// Returns true if two dates are on the same calendar day.
    func isSameDay(as otherDate: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: otherDate)
    }

    /// Returns today's start of the day (00:00).
    static func todayStart() -> Date {
        Calendar.current.startOfDay(for: Date())
    }
}
