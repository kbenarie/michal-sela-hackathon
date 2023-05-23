// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

import Redux

typealias ActionCallback<ActionType> = ((ActionType) -> Void)

class AppPresenter: RDXObserver {
  let viewController = HomeScreenViewController()
  let actionCallback: ActionCallback<AppAction>
  private let highestScorePresenter: HighestScorePresenter

  init (actionCallback: @escaping ActionCallback<AppAction>) {
    viewController.view.backgroundColor = HomeScreenViewController.backgroundColor
    self.actionCallback = actionCallback
    self.highestScorePresenter = HighestScorePresenter(
      actionCallback: { actionCallback(.highScore($0)) }
    )
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


    guard let buttonSelected = currentPresentationState.buttonSelected,
          let imageName = currentPresentationState.imageName else {
      return
    }
  }
}
