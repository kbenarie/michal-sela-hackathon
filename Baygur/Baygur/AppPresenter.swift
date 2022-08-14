// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

import Redux

typealias ActionCallback<ActionType> = ((ActionType) -> Void)

class AppPresenter: RDXObserver {
  let viewController = ViewController()
  let actionCallback: ActionCallback<AppAction>
  private let highestScorePresenter: HighestScorePresenter

  init (actionCallback: @escaping ActionCallback<AppAction>) {
    viewController.view.backgroundColor = UIColor.systemPink
    self.actionCallback = actionCallback
    self.highestScorePresenter = HighestScorePresenter(
      actionCallback: { actionCallback(.highScore($0)) }
    )
    setupCellButtonsAction()
    setupNewGameButtonAction()
    setupHighScoreButtonAction()
  }

  func setupCellButtonsAction() {
    for (index, button) in viewController.buttons.enumerated() {
      button.lt_addAction { [weak self] in
        guard let self = self else { return }
        self.actionCallback(.userPressedCell(index))
      }
    }
  }

  func setupNewGameButtonAction() {
    viewController.newGameButton.lt_addAction { [weak self] in
      guard let self = self else { return }
      self.actionCallback(.startNewGame)
    }
  }

  func setupHighScoreButtonAction() {
    viewController.highestScoresButton.lt_addAction { [weak self] in
      guard let self = self else { return }
      self.actionCallback(.highScoreButtonTapped)
    }
  }

  func didUpdate(
    fromState previousState: AppState?,
    toState currentState: AppState,
    withAction action: AppAction
  ) {
    let currentPresentationState = PresentationState.fromAppState(appState: currentState)
    let previousPresentationState = previousState != nil ?
        PresentationState.fromAppState(appState: previousState!) : nil
    if currentPresentationState.currentScreen == .highestScoreScreen {
      highestScorePresenter.update(fromState: previousPresentationState,
                                   toState: currentPresentationState, withAction: action)
    }
    if let previousPresentationState = previousPresentationState,
        previousPresentationState.currentScreen != currentPresentationState.currentScreen {
      currentPresentationState.currentScreen == .highestScoreScreen ?
          highestScorePresenter.moveIn(hostViewController: viewController) :
          highestScorePresenter.moveOut()
    }

    viewController.newGameButton.isHidden = currentPresentationState.shouldHideNewGameButton

    if currentPresentationState.shouldStartNewGame {
      viewController.resetXOButtons()
      return
    }

    guard let buttonSelected = currentPresentationState.buttonSelected,
          let imageName = currentPresentationState.imageName else {
      return
    }
    self.viewController.setImageButton(buttonNumber: buttonSelected, imageName: imageName)
  }
}
