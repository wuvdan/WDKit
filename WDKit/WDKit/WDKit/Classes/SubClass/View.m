//
//  View.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "View.h"

@interface View ()
@property (nonatomic, strong) UIView *topBorder;
@property (nonatomic, strong) UIView *leftBorder;
@property (nonatomic, strong) UIView *rightBorder;
@property (nonatomic, strong) UIView *bottomBorder;
@property (nonatomic, assign) CGFloat width;
@end

@implementation View
- (instancetype)initWithBackgroundColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

@end
