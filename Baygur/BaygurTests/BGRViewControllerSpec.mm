// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Dekel Avrahami.

#import "BGRViewController.h"

SpecBegin(BGRViewController)

// This is just an example for a test so that testing the app won't fail. There's no real need to
// test the initialization of the view controller (initializer isn't even overridden in the code).
it(@"should initialize", ^{
  BGRViewController *viewController = [[BGRViewController alloc] init];

  expect(viewController).notTo.beNil();
});

SpecEnd
