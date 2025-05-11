//
//  FeedbackOverlay.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A view overlay used to display feedback messages after a user's action.
/// This overlay can display a success or error message, and the user can dismiss it by tapping "Continue" or the overlay itself.
struct FeedbackOverlay: View {
    // Message to display in the feedback overlay (e.g., "Correct! +10 XP")
    let message: String
    // Determines whether the feedback is positive (green) or negative (red)
    let isPositive: Bool
    // Closure to handle the continuation action (e.g., dismissing the overlay)
    let onContinue: () -> Void

    var body: some View {
        ZStack {
            // Semi-transparent black background to dim the content behind the overlay
            Color.black.opacity(0.4)
                .ignoresSafeArea() // Expands the background to the entire screen
                .onTapGesture {
                    // Dismiss the overlay when the background is tapped
                    onContinue()
                }

            VStack(spacing: 16) {
                // Display the feedback message with dynamic color based on success or failure
                Text(message)
                    .font(.title2)
                    .padding()
                    .background(isPositive ? Color.green.opacity(0.8) : Color.red.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.white)

                // "Continue" button to allow user to dismiss the overlay
                Button("Continue") {
                    onContinue()
                }
                .font(.headline)
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(8)      
            }
            .padding()
        }
    }
}
