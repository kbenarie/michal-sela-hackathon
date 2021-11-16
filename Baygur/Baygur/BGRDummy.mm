// Copyright (c) 2021 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

#import "BGRDummy.h"

NS_ASSUME_NONNULL_BEGIN

@interface BGRDummy ()
@end

@implementation BGRDummy

+ (void)assert {
  LTAssert(YES, @"dummy assertion to demonstrate LTKit usage. No real need to assert here");
}

@end

NS_ASSUME_NONNULL_END
