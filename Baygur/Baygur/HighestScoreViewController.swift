// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

import UIKit

class HighestScoreViewController: UIViewController {
  let backButton = UIButton()

  let highScoreLabel = UILabel()

  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = UIColor.green
    setupBackButton()
    setupHighScoreLabel()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupBackButton() {
    backButton.setTitle("TAKE ME HOME!", for: .normal)
    backButton.setTitleColor(UIColor.black, for: .normal)
    backButton.backgroundColor = UIColor.gray
    self.view.addSubview(backButton)
    backButton.snp.makeConstraints { make in
      make.top.left.equalTo(self.view).offset(50)
    }
    backButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
  }

  func setupHighScoreLabel() {
    highScoreLabel.text = "loading..."
    highScoreLabel.textColor = UIColor.black
    highScoreLabel.backgroundColor = UIColor.systemPink
    self.view.addSubview(highScoreLabel)
    highScoreLabel.snp.makeConstraints { make in
      make.center.equalTo(self.view)
      make.width.equalTo(self.view).inset(30)
      make.height.equalTo(50)
    }
    highScoreLabel.textAlignment = NSTextAlignment.center
  }
}
