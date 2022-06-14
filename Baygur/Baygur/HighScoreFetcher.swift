//
//  HighScoreFethcer.swift
//  Baygur
//
//  Created by Maya Fleischer on 14/06/2022.
//  Copyright © 2022 Lightricks. All rights reserved.
//

/// High score result information.
struct HighScoreResult: Equatable {
  /// Name of the player that got the high score.
  let playerName: String

  /// Score of the player that got the high score.
  let score: Int
}

/// Fetcher used for fetching High score from the web.
class HighScoreFetcher {
  /// Enables performing heavy loading tasks on a background thread.
  private let loadingQueue = DispatchQueue(label: "ExternalAssetsLoader.LoadingQueue")

  private let highScoreOptions: [HighScoreResult] = [
    .init(playerName: "Sam", score: 10),
    .init(playerName: "Nir", score: 16),
    .init(playerName: "Dan", score: 11),
    .init(playerName: "Nick", score: 14),
    .init(playerName: "Rob", score: 22),
    .init(playerName: "Adi", score: 14)
  ]

  /// Fetches high scores from the web on a background thread. On completion, will call the
  /// `completion` block with the results on an arbitrary thread.
  func fetchHighScores(completion: @escaping (HighScoreResult) -> Void) {
    loadingQueue.async { [weak self] in
      guard let self = self else { return }

      // Used for simulating async work.
      sleep(4)

      let randomHighScoreToReturn = self.highScoreOptions.randomElement()!
      completion(randomHighScoreToReturn)
    }
  }
}
