// Copyright (c) 2022 Lightricks. All rights reserved.
// Created by Shira Ozeri.

class BoardView: UIView {
  var buttons = [UIButton]()
  init () {
    let image = UIImage(named: "board")
    let boardImage = UIImageView(image: image)
    super.init(frame: .zero)
    buttons = setupButtons()
    self.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
    self.addSubview(boardImage)
    boardImage.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupButtons() -> [UIButton] {
    var xoButtons = [UIButton]()
    for col in 0...2 {
      for row in 0...2 {
        let button = UIButton()
        xoButtons.append(button)
        button.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        self.addSubview(button)
        button.snp.makeConstraints { make in
          make.width.equalTo(snp.width).multipliedBy(0.25)
          make.height.equalTo(snp.height).multipliedBy(0.25)
          switch row {
          case 0:
            make.left.equalTo(snp.left).offset(10)
          case 1:
            make.centerX.equalTo(self)
          case 2:
            make.right.equalTo(snp.right).offset(-10)
          default:
            fatalError("more then 3 row")
          }
          switch col {
          case 0:
            make.top.equalTo(snp.top).offset(10)
          case 1:
            make.centerY.equalTo(self)
          case 2:
            make.bottom.equalTo(snp.bottom).offset(-10)
          default:
            fatalError("more then 3 col")
          }
        }
      }
    }
    return xoButtons
  }
}
