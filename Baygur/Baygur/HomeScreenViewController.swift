// Copyright (c) 2021 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

import SnapKit
import UIKit

class HomeScreenViewController: UIViewController {
  static let greenColor = UIColor(cgColor: .init(red: 0.505, green: 0.698, blue: 0.498, alpha: 1))
  static let backgroundColor = UIColor(
    cgColor: .init(red: 0.9333, green: 0.9333, blue: 0.9333, alpha: 1)
  )
  static let darkGrayColor = UIColor(
    cgColor: .init(red: 0.3019, green: 0.3019, blue: 0.3019, alpha: 1)
  )

  let logo = UILabel(frame: .zero)

  let privateZone = UIButton(frame: .zero)

  let therapistPool = UIButton(frame: .zero)

  let therapistType = UIButton(frame: .zero)

  let chatButton = UIButton(frame: .zero)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupLogo()
    setupTabBar()
    setupChatButton()
  }

  func setupChatButton() {
    self.view.addSubview(chatButton)
    chatButton.setAttributedTitle(
      .init(
        string: "בואו נתחיל",
        attributes: [.font: UIFont.boldSystemFont(ofSize: 40), .foregroundColor: Self.greenColor]),
      for: .normal
    )
    chatButton.layer.borderColor = Self.darkGrayColor.cgColor
    chatButton.layer.borderWidth = 5
    chatButton.layer.cornerRadius = 40
    chatButton.layer.cornerCurve = .circular

    chatButton.snp.makeConstraints { make in
      make.center.equalTo(self.view.center)
      make.width.equalTo(270)
      make.height.equalTo(80)
    }
  }

  func setupTabBar() {
    let label = UILabel(frame: .zero)
    label.backgroundColor = Self.darkGrayColor
    self.view.addSubview(label)
    label.snp.makeConstraints { make in
      make.top.equalTo(logo.snp.bottom)
      make.width.equalTo(logo)
      make.height.equalTo(60)
    }
    setupBottomBar(bottomView: label, text: "אזור אישי", button: privateZone)
    privateZone.snp.makeConstraints { make in
      make.right.equalTo(label).offset(-20)
      make.width.equalTo(90)
      make.height.equalTo(20)
      make.centerY.equalTo(label)
    }
    setupBottomBar(bottomView: label, text: "מאגר מטפלים", button: therapistPool)
    therapistPool.snp.makeConstraints { make in
      make.center.equalTo(label)
      make.width.equalTo(120)
      make.height.equalTo(20)
    }
    setupBottomBar(bottomView: label, text: "סוגי טיפול", button: therapistType)
    therapistType.snp.makeConstraints { make in
      make.left.equalTo(label).offset(20)
      make.width.equalTo(90)
      make.height.equalTo(20)
      make.centerY.equalTo(label)
    }
  }

  func setupBottomBar(bottomView: UIView, text: String, button: UIButton) {
    bottomView.addSubview(button)
    button.setAttributedTitle(
      .init(string: text, attributes: [.font: UIFont.boldSystemFont(ofSize: 20),
                                       .foregroundColor: Self.greenColor]), for: .normal
    )
  }

  func setupLogo() {
    logo.textAlignment = .center
    logo.text = "WellNest"
    logo.backgroundColor = Self.greenColor
    logo.textColor = .white
    logo.font = .boldSystemFont(ofSize: 50)
    self.navigationItem.titleView = logo
    self.view.addSubview(logo)
    logo.snp.makeConstraints { make in
      make.width.equalTo(self.view)
      make.top.equalTo(self.view.snp.top)
      make.height.equalTo(150)
    }
  }
}

//
///// Application root view controller.
//class ViewController: UIViewController {
//
//
//
//  let boardView = BoardView()
//
//  var buttons: [UIButton] {
//    boardView.buttons
//  }
//
//  let newGameButton = UIButton()
//
//  let highestScoresButton = UIButton()
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    self.view.addSubview(boardView)
//    boardView.snp.makeConstraints { make in
//      make.width.equalTo(self.view)
//      make.height.equalTo(self.view.snp.width)
//      make.center.equalTo(self.view)
//    }
//    setupNewGameButton()
//    setupHighestScoresButton()
//  }
//
//  func setImageButton(buttonNumber: Int, imageName: String) {
//    let currentButton = self.buttons[buttonNumber]
//    currentButton.setImage(UIImage(named: imageName), for: .normal)
//    currentButton.isUserInteractionEnabled = false
//  }
//
//  func setupNewGameButton() {
//    newGameButton.setTitle("New Game", for: .normal)
//    newGameButton.setTitleColor(UIColor.black, for: .normal)
//    newGameButton.backgroundColor = UIColor.gray
//    self.view.addSubview(newGameButton)
//    newGameButton.snp.makeConstraints { make in
//      make.top.equalTo(self.boardView.snp.bottom).offset(50)
//      make.centerX.equalTo(self.view)
//    }
//    newGameButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
//  }
//
//  func setupHighestScoresButton() {
//    highestScoresButton.setTitle("Highest Scores", for: .normal)
//    highestScoresButton.setTitleColor(UIColor.black, for: .normal)
//    highestScoresButton.backgroundColor = UIColor.gray
//    self.view.addSubview(highestScoresButton)
//    highestScoresButton.snp.makeConstraints { make in
//      make.top.equalTo(self.newGameButton.snp.bottom).offset(10)
//      make.centerX.equalTo(self.view)
//    }
//    highestScoresButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
//  }
//
//  func resetXOButtons() {
//    for button in self.buttons {
//      button.setImage(nil, for: .normal)
//      button.isUserInteractionEnabled = true
//    }
//  }
//}
