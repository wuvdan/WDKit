//
//  UIColor+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (WDKit)

/// 根据hex值设置颜色
/// @param hex hex值
UIColor *kHexColor(NSInteger hex);

/// 根据hex值设置颜色
/// @param hex hex值
/// @param a 透明度
UIColor *kHexAColor(NSInteger hex, CGFloat a);

/// 根据RGB值设置颜色
/// @param r 红色
/// @param g 绿色
/// @param b 蓝色
UIColor *kRGBColor(CGFloat r, CGFloat g, CGFloat b);

/// 根据RGB值设置颜色
/// @param r 红色
/// @param g 绿色
/// @param b 蓝色
/// @param a 透明度
UIColor *kRGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a);

/// 根据hex值设置颜色
/// @param hex hex值
+ (UIColor *)hexColor:(NSInteger)hex;

/// 根据hex值设置颜色
/// @param hex hex值
/// @param alpha 透明度
+ (UIColor *)hexColor:(NSInteger)hex alpha:(CGFloat)alpha;

/// 根据RGB值设置颜色
/// @param red 红色
/// @param green 绿色
/// @param blue 蓝色
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue;

/// 根据RGB值设置颜色
/// @param red 红色
/// @param green 绿色
/// @param blue 蓝色
/// @param alpha 透明度
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

/// 随机颜色
+ (UIColor *)randomColor;
@end

NS_ASSUME_NONNULL_END
