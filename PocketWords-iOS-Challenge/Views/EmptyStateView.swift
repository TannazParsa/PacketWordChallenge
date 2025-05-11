//
//  EmptyStateView.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A reusable view shown when there are no vocabulary cards available.
/// Encourages the user to add their first flashcard.
struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Icon indicating empty or missing content
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.secondary)

            // Primary message indicating empty state
            Text("No vocabulary cards yet")
                .font(.title2)
                .fontWeight(.medium)

            // Secondary instruction prompting user action
            Text("Tap the button below to add your first word")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
