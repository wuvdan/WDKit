//
//  Label.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "Label.h"

@implementation Label

+ (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont; {
    return [self initWithTextColor:textColor font:textFont numOfLines:1];
}

+ (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont numOfLines:(NSUInteger)numOfLines {
    Label *label = [[Label alloc] init];
    label.textColor = textColor;
    label.font = textFont;
    label.numberOfLines = numOfLines;
    return label;
}

@end
