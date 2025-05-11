//
//  StarBars.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A view that displays the user's total XP and the number of vocabulary cards they have.
/// The stats are presented in a horizontal bar with an icon and text for each statistic.
struct StatsBar: View {
    // The total XP earned by the user
    let totalXP: Int
    // The total number of vocabulary cards
    let cardsCount: Int

    var body: some View {
        HStack {
            // Label displaying the total XP with a star icon
            Label("\(totalXP) XP", systemImage: "star.fill")
                .font(.headline)
                .foregroundColor(.yellow)

            Spacer()

            // Text displaying the total number of cards
            Text("\(cardsCount) Cards")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}
