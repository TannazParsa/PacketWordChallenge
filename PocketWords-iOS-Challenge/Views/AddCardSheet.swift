//
//  AddCardSheet.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import Foundation
import SwiftUI

/// A bottom sheet form for creating a new word card, including word and meaning fields.
/// Presented as a modal and dismissed on save or cancel.
struct AddCardSheet: View {
    @ObservedObject var viewModel: WordsViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationView {
            Form {
                // Input for the new vocabulary word
                TextField("New Word", text: $viewModel.newWord)

                // Input for the corresponding meaning
                TextField("Meaning", text: $viewModel.newMeaning)
            }
            .navigationTitle("Add New Card")
            .toolbar {
                // Save and persist the new card, then close the sheet
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addNewCard(modelContext: modelContext)
                        dismiss()
                    }
                }

                // Cancel and dismiss the sheet without saving
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
