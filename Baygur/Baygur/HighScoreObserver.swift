// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

import Redux

class HighScoreObserver: RDXObserver {
  let fetcher = HighScoreFetcher()

  let actionCallback: ActionCallback<AppAction>

  init (actionCallback: @escaping ActionCallback<AppAction>) {
    self.actionCallback = actionCallback
  }

  func didUpdate(
    fromState previousState: AppState?,
    toState currentState: AppState,
    withAction action: AppAction
  ) {
    if currentState.highScoreFetchingStatus == .requested {
      fetcher.fetchHighScores { result in
        DispatchQueue.main.async {
          self.actionCallback(.fetchHighScoreCompleted(result))
        }
      }
    }
  }
}
