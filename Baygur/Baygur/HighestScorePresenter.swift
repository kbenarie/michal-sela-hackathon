// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

class HighestScorePresenter {
  let highestScoreViewController = HighestScoreViewController()
  let actionCallback: ActionCallback<HighScoreAction>

  init (actionCallback: @escaping ActionCallback<HighScoreAction>) {
    self.actionCallback = actionCallback
    highestScoreViewController.backButton.lt_addAction { [weak self] in
      guard let self = self else { return }
      self.actionCallback(.backButtonPressed)
    }
  }

  func moveIn(hostViewController: UIViewController) {
    hostViewController.present(highestScoreViewController, animated: true)
  }

  func moveOut() {
    highestScoreViewController.dismiss(animated: true)
  }

  func update(
    fromState previousState: PresentationState?,
    toState currentState: PresentationState,
    withAction action: AppAction
  ) {
    guard let scoreText = currentState.highestScoreText else {
      return
    }
    highestScoreViewController.highScoreLabel.text = scoreText
  }
}
