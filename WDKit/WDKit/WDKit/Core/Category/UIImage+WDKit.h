//
//  UIImage+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WDKit)

/// 图片读取
/// @param named 图片名称
UIImage *kTemplateImage(NSString *named);

/// 设置图片读取为 `Always Template`
/// @param named 图片名称
+ (UIImage *)templateNamed:(NSString *)named;

/// 用颜色返回一张图片
/// @param color 显示颜色
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 用颜色返回指定尺寸的一张图片
/// @param color 显示颜色
/// @param size 大小
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/// 设置圆角
/// @param radius 圆角大小
/// @param size 大小
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
