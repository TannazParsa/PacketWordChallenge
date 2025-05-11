//
//  CardStackView.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import SwiftUI

/// A card view displaying either the word (front) or meaning (back),
/// with an input field for user guesses and a submit button.
struct CardStackView: View {
    let card: WordCard
    let isBackShown: Bool
    @Binding var currentAnswer: String
    let isAnswerDisabled: Bool
    let onSubmit: () -> Void
    let onCheck: () -> Void
    let onFlip: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            // Display the main word and handle tap to flip the card
            Text(card.word)
                .font(.largeTitle)
                .padding()
                .onTapGesture {
                    onFlip()
                }

            if isBackShown {
                // Show the card's meaning if the back side is visible
                Text(card.meaning)
                    .font(.title2)
                    .foregroundColor(.secondary)
            } else {
                // Input field for user's answer
                TextField("Enter meaning", text: $currentAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .disabled(isAnswerDisabled)

                // Submit answer button
                Button("Submit", action: onSubmit)
                    .disabled(isAnswerDisabled)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}
