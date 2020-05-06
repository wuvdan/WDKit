//
//  UILabel+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UILabel+WDKit.h"

@implementation UILabel (WDKit)
- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)textFont {
    return [self initWithText:text textColor:textColor font:textFont numOfLines:1];
}

- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont {
    return [self initWithText:@"" textColor:textColor font:textFont numOfLines:1];
}

- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont numOfLines:(NSUInteger)numOfLines {
    return [self initWithText:@"" textColor:textColor font:textFont numOfLines:numOfLines];
}

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)textFont numOfLines:(NSUInteger)numOfLines {
    self = [super init];
    if (self) {
        self.text = text;
        self.textColor = textColor;
        self.font = textFont;
        self.numberOfLines = numOfLines;
    }
    return self;
}
@end
