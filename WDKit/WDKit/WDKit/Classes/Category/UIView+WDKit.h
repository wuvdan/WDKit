//
//  UIView+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/4/29.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ViewGradientChangeDirection) {
    ViewGradientChangeDirectionLevel,                  //水平方向渐变
    ViewGradientChangeDirectionVertical,               //垂直方向渐变
    ViewGradientChangeDirectionUpwardDiagonalLine,     //主对角线方向渐变
    ViewGradientChangeDirectionDownDiagonalLine,       //副对角线方向渐变
};

typedef NS_OPTIONS(NSUInteger, ViewBorderDirection) {
    ViewBorderDirectionTop    = 1 << 0,
    ViewBorderDirectionBottom = 1 << 1,
    ViewBorderDirectionLeft   = 1 << 2,
    ViewBorderDirectionRight  = 1 << 3,
    ViewBorderDirectionAll    = 1 << 4,
};

@interface UIView (WDKit)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;


/// 控件尺寸比例处理  `参照4.0 inch`
CGFloat kSuitWidthSize(CGFloat value);

/// 控件尺寸比例处理 `参照4.0 inch`
CGFloat kSuitHeightSize(CGFloat value);

/// 设置渐变色
/// @param size 渐变区域的尺寸
/// @param direction 渐变方向
/// @param startcolor 开始颜色
/// @param endColor 结束颜色
- (void)setupColorGradientChangeWithSize:(CGSize)size
                               direction:(ViewGradientChangeDirection)direction
                              startColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor;

/// 设置部分圆角
/// @param rect 视图大小
/// @param cornerRadii 圆角尺寸
/// @param byRoundingCorners 圆角位置
- (void)setupRoundedRect:(CGRect)rect
             cornerRadii:(CGSize)cornerRadii
       byRoundingCorners:(UIRectCorner)byRoundingCorners;

/// 设置阴影
/// @param shadowColor 颜色
/// @param opacity 透明度
/// @param offset 偏移量
/// @param shadowRadius 阴影圆角
- (void)setupShadowColor:(UIColor *)shadowColor
                 opacity:(CGFloat)opacity
                  offset:(CGSize)offset
            shadowRadius:(CGFloat)shadowRadius;

/// 设置边框（不适用UIScrollView的子类）
/// @param color 颜色
/// @param width 宽度/高度
/// @param borderDirection 上、下、左、右
- (void)setupBoderColor:(UIColor *)color
                  width:(CGFloat)width
        borderDirection:(ViewBorderDirection)borderDirection;


/// 返回屏幕截图
- (UIImage *)snapshotImage;

/// 找到自己所在的控制器,判断是否存在之后,使用
- (UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
