//
//  PocketWords_iOS_ChallengeTests.swift
//  PocketWords-iOS-ChallengeTests
//
//  Created by tanaz on 21/02/1404 AP.
//

import XCTest
@testable import PocketWords_iOS_Challenge

final class PocketWordsTests: XCTestCase {
    var viewModel: WordsViewModel!
    var testCard: WordCard!

    override func setUp() {
        super.setUp()
        viewModel = WordsViewModel()
        testCard = WordCard(word: "Bonjour", meaning: "Hello")
    }

    override func tearDown() {
        viewModel = nil
        testCard = nil
        super.tearDown()
    }

    func testCheckAnswer() {
        // Test exact match
        viewModel.currentAnswer = "Hello"
        XCTAssertTrue(viewModel.checkAnswer(for: testCard))
        XCTAssertEqual(testCard.correctAttempts, 1)
        XCTAssertEqual(testCard.totalAttempts, 1)

        // Test case insensitivity
        viewModel.currentAnswer = "hello"
        XCTAssertTrue(viewModel.checkAnswer(for: testCard))
        XCTAssertEqual(testCard.correctAttempts, 2)
        XCTAssertEqual(testCard.totalAttempts, 2)

        // Test whitespace trimming
        viewModel.currentAnswer = "  Hello  "
        XCTAssertTrue(viewModel.checkAnswer(for: testCard))
        XCTAssertEqual(testCard.correctAttempts, 3)
        XCTAssertEqual(testCard.totalAttempts, 3)

        // Test incorrect answer
        viewModel.currentAnswer = "Goodbye"
        XCTAssertFalse(viewModel.checkAnswer(for: testCard))
        XCTAssertEqual(testCard.correctAttempts, 3)
        XCTAssertEqual(testCard.totalAttempts, 4)
    }
}
