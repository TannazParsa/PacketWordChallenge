//
//  ProgressSection.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A view that displays a progress bar and a text label indicating the user's progress percentage.
/// The progress represents the completion of a task or goal, such as mastering vocabulary cards.
struct ProgressSection: View {
    // The current progress as a value between 0.0 and 1.0, representing the completion percentage
    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Progress bar showing the completion percentage
            ProgressView(value: progress)
                .tint(.green) // Green color for the progress bar
                .accessibilityLabel("Progress") // Label for accessibility (screen readers)
                .accessibilityValue("\(Int(progress * 100))% complete") // Detailed progress for accessibility

            // Text showing the percentage of mastery in a caption style
            Text("Mastery: \(Int(progress * 100))%")
                .font(.caption) // Use a smaller font size for the percentage text
                .foregroundColor(.secondary) // Dim the text for a secondary appearance
        }
        .padding(.horizontal) // Add horizontal padding for spacing
    }
}
