//
//  UIButton+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ButtonImageStyle) {
    ButtonImageStyleTop,
    ButtonImageStyleLeft,
    ButtonImageStyleRight,
    ButtonImageStyleBottom
};

@interface UIButton (WDKit)

/// 初始化 `仅标题`
/// @param title 标题
/// @param titleColor 字体颜色
/// @param font 字体大小
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

/// 初始化 `图片 +  文字`
/// @param title 标题
/// @param titleColor 字体颜色
/// @param imageNamed 图片名称
/// @param font 字体大小
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imageNamed:(NSString *)imageNamed font:(UIFont *)font;

/// 设置背景颜色
/// @param color 颜色
/// @param state 状态
- (void)setupBackgroundColor:(UIColor *)color forState:(UIControlState)state;

/// 设置图片 + 文字的样式
/// @param style 样式
/// @param spacing 间隙
- (void)setupButtonImageStyle:(ButtonImageStyle)style spacing:(CGFloat)spacing; 
@end

NS_ASSUME_NONNULL_END
