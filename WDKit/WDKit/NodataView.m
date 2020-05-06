//
//  NodataView.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "NodataView.h"
#import "UIColor+WDKit.h"

@implementation NodataView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
    }
    return self;
}

@end
