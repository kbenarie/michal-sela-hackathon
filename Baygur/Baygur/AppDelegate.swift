// Copyright (c) 2021 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

import Redux
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  typealias AppStore = RDXStore<AppAction, AppState>

  var window: UIWindow?

  let store: AppStore

  let presenter: AppPresenter

  override init() {
    let appReducer = AppReducer()
    store = AppStore(reducer: AnyReducer(appReducer))
    presenter = AppPresenter(actionCallback: { [weak store = self.store] action in
      store?.dispatch(action)
    })
    let highScoreObserver = HighScoreObserver(actionCallback: { [weak store = self.store] action in
      store?.dispatch(action)
    })
    store.observers.append(AnyObserver(presenter))
    store.observers.append(AnyObserver(highScoreObserver))
    store.dispatch(.startedApp(AppState.initialState()))
    super.init()
  }

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    window = UIWindow()
    window?.rootViewController = presenter.viewController
    window?.makeKeyAndVisible()
    return true
  }
}
