//
//  UIFont+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIFont+WDKit.h"

@implementation UIFont (WDKit)
UIFont *kNormalFont(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

UIFont *kNormalWFont(CGFloat size, UIFontWeight weight) {
    return [UIFont systemFontOfSize:size weight:weight];
}

+ (UIFont *)scaleFont:(CGFloat)size weight:(UIFontWeight)weight {
    if (UIScreen.mainScreen.bounds.size.width <= 375) {
        return [UIFont systemFontOfSize:size * UIScreen.mainScreen.bounds.size.width / 375 weight:weight];
    } else {
        return [UIFont systemFontOfSize:size * 1.2 weight:weight];
    }
}

+ (UIFont *)scaleFont:(CGFloat)size {
    if (UIScreen.mainScreen.bounds.size.width <= 375) {
        return [UIFont systemFontOfSize:size * UIScreen.mainScreen.bounds.size.width / 375];
    } else {
        return [UIFont systemFontOfSize:size * 1.2];
    }
}
@end
