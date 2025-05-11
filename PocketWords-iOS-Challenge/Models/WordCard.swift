//
//  WordCard.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftData

@Model
final class WordCard {
    /// The vocabulary word being studied.
    var word: String

    /// The meaning or definition of the word.
    var meaning: String

    /// Number of times the user answered correctly for this word.
    var correctAttempts: Int

    /// Total number of times this word has been reviewed.
    var totalAttempts: Int

    /// Timestamp of the last time the word was reviewed, if any.
    var lastReviewed: Date?

    /// Initializes a new word card with default attempt values.
    /// - Parameters:
    ///   - word: The vocabulary word.
    ///   - meaning: The definition of the word.
    init(word: String, meaning: String) {
        self.word = word
        self.meaning = meaning
        self.correctAttempts = 0
        self.totalAttempts = 0
        self.lastReviewed = nil
    }

    /// The user's success rate for this word.
    ///
    /// Returns a value between 0 and 1. If the word hasn't been reviewed yet, returns 0.
    var successRate: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctAttempts) / Double(totalAttempts)
    }
}
