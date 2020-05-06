//
//  UILabel+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (WDKit)
/// 初始化
/// @param text 显示文本
/// @param textColor 字体颜色
/// @param textFont 字体大小
- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)textFont;

/// 初始化
/// @param textColor 字体颜色
/// @param textFont 字体大小
- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont;

/// 初始化
/// @param textColor 字体颜色
/// @param textFont 字体大小
/// @param numOfLines 文字显示行数
- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont numOfLines:(NSUInteger)numOfLines;
@end

NS_ASSUME_NONNULL_END
