//
//  Untitled.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftData

@Model
final class UserProgress {
    /// Accumulated experience points (XP) earned by the user.
    var xp: Int

    /// The date when the user last used the app.
    var lastSessionDate: Date

    /// Number of consecutive days the user has engaged with the app.
    var streakDays: Int

    /// Initializes a new user progress record with default or provided values.
    /// - Parameters:
    ///   - xp: Initial XP value (default is 0).
    ///   - lastSessionDate: Last session date (default is today).
    ///   - streakDays: Initial streak count (default is 1).
    init(xp: Int = 0, lastSessionDate: Date = Date(), streakDays: Int = 1) {
        self.xp = xp
        self.lastSessionDate = lastSessionDate
        self.streakDays = streakDays
    }

    /// Updates the user's streak based on their activity.
    ///
    /// - If the user was active yesterday, increment the streak.
    /// - If there's a gap (i.e., not today or yesterday), reset the streak to 1.
    /// - Always updates `lastSessionDate` to today after evaluation.
    func updateStreak() {
        let calendar = Calendar.current
        let today = Date()

        let wasActiveYesterday = calendar.isDate(
            lastSessionDate,
            inSameDayAs: calendar.date(byAdding: .day, value: -1, to: today) ?? today
        )

        if wasActiveYesterday {
            streakDays += 1
        } else if !calendar.isDate(lastSessionDate, inSameDayAs: today) {
            streakDays = 1
        }

        lastSessionDate = today
    }
}
