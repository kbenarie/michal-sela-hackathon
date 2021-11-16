// Copyright (c) 2021 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

@testable import Baygur

import Nimble
import Spectacle

class ViewControllerSpec: Spec {
  override class func spec() {
    // This is just an example for a test so that testing the app won't fail. There's no real need
    // to test the initialization of the view controller (initializer isn't even overridden in the
    // code).
    it("should initialize") {
      let viewController = ViewController()
      expect(viewController).notTo(beNil())
    }
  }
}
