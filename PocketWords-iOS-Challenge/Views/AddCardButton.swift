//
//  AddCardButton.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A floating button used to present the add-new-card sheet.
struct AddCardButton: View {
    @ObservedObject var viewModel: WordsViewModel

    var body: some View {
        Button(action: {
            viewModel.isShowingAddSheet = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .padding()
        }
        .accessibilityLabel("Add new word card")
        .accessibilityHint("Opens a form to add a new flashcard")
    }
}
