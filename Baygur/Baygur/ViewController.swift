// Copyright (c) 2021 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

import SnapKit
import UIKit

/// Application root view controller.
class ViewController: UIViewController {
  let boardView = BoardView()

  var buttons: [UIButton] {
    boardView.buttons
  }

  let newGameButton = UIButton()

  let highestScoresButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(boardView)
    boardView.snp.makeConstraints { make in
      make.width.equalTo(self.view)
      make.height.equalTo(self.view.snp.width)
      make.center.equalTo(self.view)
    }
    setupNewGameButton()
    setupHighestScoresButton()
  }

  func setImageButton(buttonNumber: Int, imageName: String) {
    let currentButton = self.buttons[buttonNumber]
    currentButton.setImage(UIImage(named: imageName), for: .normal)
    currentButton.isUserInteractionEnabled = false
  }

  func setupNewGameButton() {
    newGameButton.setTitle("New Game", for: .normal)
    newGameButton.setTitleColor(UIColor.black, for: .normal)
    newGameButton.backgroundColor = UIColor.gray
    self.view.addSubview(newGameButton)
    newGameButton.snp.makeConstraints { make in
      make.top.equalTo(self.boardView.snp.bottom).offset(50)
      make.centerX.equalTo(self.view)
    }
    newGameButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
  }

  func setupHighestScoresButton() {
    highestScoresButton.setTitle("Highest Scores", for: .normal)
    highestScoresButton.setTitleColor(UIColor.black, for: .normal)
    highestScoresButton.backgroundColor = UIColor.gray
    self.view.addSubview(highestScoresButton)
    highestScoresButton.snp.makeConstraints { make in
      make.top.equalTo(self.newGameButton.snp.bottom).offset(10)
      make.centerX.equalTo(self.view)
    }
    highestScoresButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
  }

  func resetXOButtons() {
    for button in self.buttons {
      button.setImage(nil, for: .normal)
      button.isUserInteractionEnabled = true
    }
  }
}
