//
//  PocketWords_iOS_ChallengeApp.swift
//  PocketWords-iOS-Challenge
//
//  Created by tanaz on 21/02/1404 AP.
//

import SwiftUI
import SwiftData

@main
struct PocketWords_iOS_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .modelContainer(for: WordCard.self)
        }
    }
}
