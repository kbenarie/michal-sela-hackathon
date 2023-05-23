//
//  TherapistsPoolViewController.swift
//  Baygur
//
//  Created by Shira Ozeri on 23/05/2023.
//  Copyright © 2023 Lightricks. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class TherapistsPoolViewController: UIViewController {
  static let greenColor = UIColor(cgColor: .init(red: 0.505, green: 0.698, blue: 0.498, alpha: 1))
  static let backgroundColor = UIColor(
    cgColor: .init(red: 0.9333, green: 0.9333, blue: 0.9333, alpha: 1)
  )
  static let darkGrayColor = UIColor(
    cgColor: .init(red: 0.3019, green: 0.3019, blue: 0.3019, alpha: 1)
  )

  let location = UIScrollView(frame: .zero)
  let profession = UIScrollView(frame: .zero)
  let placeHolder1 = UIScrollView(frame: .zero)
  let placeHolder2 = UIScrollView(frame: .zero)
  let placeHolder3 = UIScrollView(frame: .zero)
  let placeHolder4 = UIScrollView(frame: .zero)


  override func viewDidLoad() {
    super.viewDidLoad()


    setupButton(title: "מיקום", button: self.location)
    setupButton(title: "מקצוע", button: self.profession)
    setupButton(title: "תחום", button: self.placeHolder1)
    setupButton(title: "סבסוד", button: self.placeHolder2)
    setupButton(title: "מיקום", button: self.placeHolder3)
    setupButton(title: "מיקום", button: self.placeHolder4)
  }

  func setupButton(title: String, button: UIScrollView) {
    self.view.addSubview(button)
    scrollView.
    button.layer.borderColor = Self.darkGrayColor.cgColor
    button.layer.borderWidth = 5
    button.layer.cornerRadius = 40
    button.layer.cornerCurve = .circular
  }
}
