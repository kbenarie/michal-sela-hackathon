// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

import Redux

class AppReducer: RDXReducer {
  let highScoreReducer = HighScoreScreenReducer()

  func process(action: AppAction, with state: AppState?) -> AppState {
    guard let currentState = state else {
      guard case let .startedApp(state) = action
      else {
        fatalError("tried to process action (\(action)) that is not started while state is nil")
      }
      return state
    }
    switch action {
    case .startedApp:
      fatalError("tried to process action (\(action)) that is not started while state is nil")
    case .startNewGame:
      return AppState(buttonSelected: nil, xTurn: false, startNewGame: true,
                      currentScreen: .mainScreen, isBoardEmpty: true, highScoreFetchingStatus: nil)
    case .highScoreButtonTapped:
      return AppState(buttonSelected: nil, xTurn: currentState.xTurn, startNewGame: false,
                      currentScreen: .highestScoreScreen, isBoardEmpty: currentState.isBoardEmpty,
                      highScoreFetchingStatus: .requested)
    case let .highScore(highScoreAction):
      return highScoreReducer.process(action: highScoreAction, state: currentState)
    case let .userPressedCell(indexCell):
      return AppState(buttonSelected: indexCell, xTurn: !currentState.xTurn,
                      startNewGame: false, currentScreen: .mainScreen, isBoardEmpty: false,
                      highScoreFetchingStatus: nil)
    case let .fetchHighScoreCompleted(result):
      return AppState(buttonSelected: nil, xTurn: currentState.xTurn,
                      startNewGame: false, currentScreen: .highestScoreScreen,
                      isBoardEmpty: currentState.isBoardEmpty,
                      highScoreFetchingStatus: .completed(result))
    }
  }
}
