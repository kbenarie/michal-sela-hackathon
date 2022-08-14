// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

enum CurrentScreen {
  case mainScreen
  case highestScoreScreen
}

enum HighestScoreDataFetchingStatus: Equatable {
  case requested
  case completed(HighScoreResult)
}

struct PresentationState {
  let buttonSelected: Int?
  let imageName: String?
  let shouldStartNewGame: Bool
  let currentScreen: CurrentScreen
  let shouldHideNewGameButton: Bool
  let highestScoreText: String?

  static func fromAppState(appState: AppState) -> PresentationState {
    let imageName = appState.xTurn ? "x_sign" : "o_sign"
    var currentHighestScoreText: String?
    switch appState.highScoreFetchingStatus {
    case .requested:
      currentHighestScoreText = "LOADING.."
    case let .completed(highResult):
      currentHighestScoreText = "\(highResult.playerName) : \(highResult.score)"
    case .none:
      currentHighestScoreText = nil
    }
    return .init(buttonSelected: appState.buttonSelected, imageName: imageName,
                 shouldStartNewGame: appState.startNewGame, currentScreen: appState.currentScreen,
                 shouldHideNewGameButton: appState.isBoardEmpty,
                 highestScoreText: currentHighestScoreText)
  }
}

struct AppState: Equatable {
  let buttonSelected: Int?
  var xTurn: Bool
  let startNewGame: Bool
  let currentScreen: CurrentScreen
  let isBoardEmpty: Bool
  let highScoreFetchingStatus: HighestScoreDataFetchingStatus?

  static func initialState () -> AppState {
    return .init(buttonSelected: nil, xTurn: false, startNewGame: true, currentScreen: .mainScreen,
                 isBoardEmpty: true, highScoreFetchingStatus: nil)
  }
}
