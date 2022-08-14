// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

class HighScoreScreenReducer {
  func process(action: HighScoreAction, state: AppState) -> AppState {
    switch action {
    case .backButtonPressed:
      return AppState(buttonSelected: nil, xTurn: state.xTurn, startNewGame: false,
                      currentScreen: .mainScreen, isBoardEmpty: state.isBoardEmpty,
                      highScoreFetchingStatus: nil)
    }
  }
}
