//
//  ContentView.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import SwiftUI
import SwiftData

/// The main view displaying the user's card progress, current card interaction,
/// and entry point for adding new flashcards.
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [WordCard]
    @StateObject private var viewModel = WordsViewModel()
    @State private var currentCardIndex = 0
    @State private var isShowingBottomSheet = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Display user stats including XP and total number of cards
                StatsBar(totalXP: viewModel.totalXP, cardsCount: cards.count)

                // Show progress bar if cards are available
                if !cards.isEmpty {
                    ProgressSection(progress: viewModel.calculateProgress(from: cards))
                }

                Spacer()

                // Show empty state if there are no cards
                if cards.isEmpty {
                    EmptyStateView()
                } else {
                    ZStack(alignment: .topTrailing) {
                        // Primary card display view
                        CardStackView(
                            card: cards[currentCardIndex],
                            isBackShown: viewModel.isShowingCardBack,
                            currentAnswer: $viewModel.currentAnswer,
                            isAnswerDisabled: viewModel.isShowingCardBack || viewModel.isShowingFeedback,
                            onSubmit: {
                                handleAnswer()
                            },
                            onCheck: {
                                handleAnswer()
                            },
                            onFlip: {
                                if !viewModel.isShowingFeedback {
                                    viewModel.flipCard()
                                }
                            }
                        )
                        .padding(.horizontal)

                        // Action button to proceed to the next card
                        Button(action: showNextCard) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.blue)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.white.opacity(0.7))
                                        .shadow(radius: 2)
                                )
                        }
                        .disabled(cards.isEmpty)
                        .padding(.trailing, 24)
                        .padding(.top, 8)
                    }
                }

                Spacer()

                // Button to open the add card sheet
                AddCardButton(viewModel: viewModel)
            }

            // Overlay shown after submitting an answer with feedback
            if viewModel.isShowingFeedback {
                FeedbackOverlay(
                    message: viewModel.feedbackMessage ?? "",
                    isPositive: viewModel.feedbackIsPositive,
                    onContinue: {
                        viewModel.resetFeedback()
                    }
                )
            }
        }
        .sheet(isPresented: $viewModel.isShowingAddSheet) {
            AddCardSheet(viewModel: viewModel, modelContext: _modelContext)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .navigationTitle("PocketWords")
    }

    /// Advances to the next flashcard in the list with an animation.
    private func showNextCard() {
        withAnimation {
            currentCardIndex = (currentCardIndex + 1) % max(1, cards.count)
            viewModel.resetCardState()
        }
    }

    /// Handles answer submission by checking the result and flipping the card.
    private func handleAnswer() {
        guard !viewModel.isShowingCardBack else { return }
        let currentCard = cards[currentCardIndex]
        _ = viewModel.checkAnswer(for: currentCard)
        viewModel.flipCard()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: WordCard.self, inMemory: true)
}
