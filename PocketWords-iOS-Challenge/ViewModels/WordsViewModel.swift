//
//  WordsViewModel.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftData
import Combine
import SwiftUI

/// ViewModel responsible for managing word cards, user input, and feedback logic.
final class WordsViewModel: ObservableObject {

    // MARK: - User Progress Properties

    /// Total XP accumulated by the user. Persisted using UserDefaults.
    var totalXP: Int = UserDefaults.standard.integer(forKey: "totalXP") {
        didSet {
            UserDefaults.standard.set(totalXP, forKey: "totalXP")
        }
    }

    // MARK: - Card Interaction State

    /// The user's current answer input.
    var currentAnswer: String = ""

    /// Message shown in the feedback overlay after answer submission.
    var feedbackMessage: String?

    /// Determines if feedback overlay should be displayed.
    var isShowingFeedback: Bool = false

    /// Indicates whether the submitted answer was correct.
    var feedbackIsPositive: Bool = false

    /// Controls whether the add card sheet is presented.
    @Published var isShowingAddSheet: Bool = false

    /// Controls whether the back of the flashcard is shown.
    var isShowingCardBack: Bool = false

    // MARK: - New Card Form Input

    /// New word entered by the user.
    var newWord: String = ""

    /// Meaning associated with the new word.
    var newMeaning: String = ""

    // MARK: - Answer Checking

    /// Validates the user's input against the given card and updates feedback state.
    /// - Parameter card: The `WordCard` being reviewed.
    /// - Returns: Boolean indicating whether the answer was correct.
    func checkAnswer(for card: WordCard) -> Bool {
        let normalizedInput = currentAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let normalizedCorrect = card.meaning.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        let isCorrect = normalizedInput == normalizedCorrect

        // Update card attempt stats
        card.totalAttempts += 1
        if isCorrect {
            card.correctAttempts += 1
            totalXP += 10
            feedbackMessage = "Correct! +10 XP"
            feedbackIsPositive = true
        } else {
            feedbackMessage = "Incorrect. The correct answer is: \(card.meaning)"
            feedbackIsPositive = false
        }

        card.lastReviewed = Date()
        isShowingFeedback = true
        currentAnswer = ""

        return isCorrect
    }

    // MARK: - Feedback & UI State Management

    /// Resets feedback display and messages.
    func resetFeedback() {
        isShowingFeedback = false
        feedbackMessage = nil
    }

    /// Flips the card view with animation.
    func flipCard() {
        withAnimation(.spring) {
            isShowingCardBack.toggle()
        }
    }

    // MARK: - Add Card Logic

    /// Adds a new card to the data model if inputs are valid.
    /// - Parameter modelContext: The SwiftData model context for persistence.
    func addNewCard(modelContext: ModelContext) {
        guard !newWord.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !newMeaning.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        let card = WordCard(word: newWord, meaning: newMeaning)
        modelContext.insert(card)

        // Clear input and dismiss sheet
        newWord = ""
        newMeaning = ""
        isShowingAddSheet = false
    }

    // MARK: - Progress Calculation

    /// Calculates the average success rate across all word cards.
    /// - Parameter cards: The list of `WordCard`s.
    /// - Returns: A Double representing average success (0 to 1).
    func calculateProgress(from cards: [WordCard]) -> Double {
        guard !cards.isEmpty else { return 0.0 }
        return cards.map { $0.successRate }.reduce(0, +) / Double(cards.count)
    }

    /// Resets the flashcard state for the next question.
    func resetCardState() {
        isShowingCardBack = false
        resetFeedback()
    }
}
