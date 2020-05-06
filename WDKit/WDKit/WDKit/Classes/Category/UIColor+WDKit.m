//
//  UIColor+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIColor+WDKit.h"

@implementation UIColor (WDKit)

UIColor *kHexColor(NSInteger hex) {
    return kHexAColor(hex, 1);
}

UIColor *kHexAColor(NSInteger hex,CGFloat a) {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:a];
}

UIColor *kRGBColor(CGFloat r, CGFloat g, CGFloat b) {
    return kRGBAColor(r, g, b, 1);
}

UIColor *kRGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

+ (UIColor *)hexColor:(NSInteger)hex {
    return kHexColor(hex);
}

+ (UIColor *)hexColor:(NSInteger)hex alpha:(CGFloat)alpha {
    return kHexAColor(hex, alpha);
}

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue {
    return kRGBColor(red, green, blue);
}

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha {
    return kRGBAColor(red, green, blue, alpha);
}

+ (UIColor *)randomColor {
    return kRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
}
@end
