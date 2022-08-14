// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

enum HighScoreAction: Equatable {
  case backButtonPressed
}

enum AppAction: Equatable {
  case startedApp (AppState)
  case userPressedCell (Int)
  case startNewGame
  case highScoreButtonTapped
  case highScore (HighScoreAction)
  case fetchHighScoreCompleted (HighScoreResult)
}
