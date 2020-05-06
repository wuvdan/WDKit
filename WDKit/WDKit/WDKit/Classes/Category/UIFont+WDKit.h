//
//  UIFont+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (WDKit)
/// 设置普通字体样式
/// @param size 大小
UIFont *kNormalFont(CGFloat size);

/// 设置字体样式
/// @param size 大小
/// @param weight 字体样式
UIFont *kNormalWFont(CGFloat size, UIFontWeight weight);

/// 设置普通字体样式
/// @param size 大小
+ (UIFont *)scaleFont:(CGFloat)size;

/// 设置字体样式
/// @param size 大小
/// @param weight 字体样式
+ (UIFont *)scaleFont:(CGFloat)size weight:(UIFontWeight)weight;

@end

NS_ASSUME_NONNULL_END
