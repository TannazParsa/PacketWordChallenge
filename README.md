# PocketWords

**PocketWords** is a flash card vocabulary app for iOS that helps users learn new words through practice and repetition.

---

## Architecture

The app follows the **MVVM (Model-View-ViewModel)** architecture, which ensures a clean separation of concerns:

- **Model**: `WordCard` – SwiftData model representing vocabulary cards.
- **ViewModel**: `WordsViewModel` – Handles business logic and state management.
- **View**: `ContentView` and supporting views – UI components.

---

## Features

PocketWords includes the following features:

- **Add vocabulary cards**: Users can easily create word-meaning pairs.
- **Interactive flashcards**: Cards are animated with a 3D flip for an engaging learning experience.
- **Answer validation**: Provides visual feedback to help users check their answers.
- **XP progression system**: Users earn XP points as they progress through cards.
- **Progress tracking**: Track progress across all vocabulary cards.
- **Full persistence with SwiftData**: All data is stored persistently using SwiftData.
- **Accessibility support**: Fully accessible for VoiceOver users.

---

## Build & Test

### Requirements

- **Xcode**: 16+
- **iOS target version**: 18+ (For both device and simulator)

### Build Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/PocketWords.git
    ```

2. Open the `PocketWords.xcodeproj` in Xcode.

3. Select a target device (iPhone).

4. Build and run the app:
    - Press `⌘+R` to run the app on the selected target.

### Test

Run unit tests to validate core functionality:
- **Answer-checking logic** is validated with the unit tests.
- Press `⌘+U` to run tests.

---

## Trade-offs & Decisions

Here are some important design and architectural decisions made during development:

- **Fluid UX over extensive features**: The focus is on creating a smooth user experience rather than adding many features.
- **@Observable pattern for ViewModel**: Used as a modern approach to manage state efficiently.
- **Gamification with XP**: Added a progression system to keep users engaged through earning XP points.
- **Simplified local storage with SwiftData**: Chose SwiftData for persistence due to its simplicity and integration with Swift.
- **Prioritized accessibility**: Ensured the app is accessible to all users, including those relying on VoiceOver.

---
