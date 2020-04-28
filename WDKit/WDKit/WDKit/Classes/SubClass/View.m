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

@end

@implementation View
- (instancetype)initWithBackgroundColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

- (void)setupBoderColor:(UIColor *)color borderDirection:(ViewBorderDirection)borderDirection {
    
    if (borderDirection & ViewBorderDirectionTop) {
        self.topBorder.backgroundColor = color;
        [self addSubview:self.topBorder];
    }
    if (borderDirection & ViewBorderDirectionBottom) {
        self.bottomBorder.backgroundColor = color;
        [self addSubview:self.bottomBorder];
    }
    if (borderDirection & ViewBorderDirectionLeft) {
        self.leftBorder.backgroundColor = color;
        [self addSubview:self.leftBorder];
    }
    if (borderDirection & ViewBorderDirectionRight) {
        self.rightBorder.backgroundColor = color;
        [self addSubview:self.rightBorder];
    }
    
    if (borderDirection & ViewBorderDirectionAll) {
        self.rightBorder.backgroundColor = color;
        [self addSubview:self.rightBorder];
        
        self.topBorder.backgroundColor = color;
        [self addSubview:self.topBorder];
          
        self.bottomBorder.backgroundColor = color;
        [self addSubview:self.bottomBorder];
          
        self.leftBorder.backgroundColor = color;
        [self addSubview:self.leftBorder];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5);
    self.bottomBorder.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5);
    self.leftBorder.frame = CGRectMake(0, 0, 0.5, CGRectGetHeight(self.frame));
    self.rightBorder.frame = CGRectMake(CGRectGetWidth(self.frame) - 0.5, 0, 0.5, CGRectGetHeight(self.frame));
}

- (UIView *)topBorder {
    if (!_topBorder) {
        _topBorder = [[UIView alloc] init];
    }
    return _topBorder;
}

- (UIView *)leftBorder {
    if (!_leftBorder) {
        _leftBorder = [[UIView alloc] init];
    }
    return _leftBorder;
}

- (UIView *)rightBorder {
    if (!_rightBorder) {
        _rightBorder = [[UIView alloc] init];
    }
    return _rightBorder;
}

- (UIView *)bottomBorder {
    if (!_bottomBorder) {
        _bottomBorder = [[UIView alloc] init];
    }
    return _bottomBorder;
}
@end
