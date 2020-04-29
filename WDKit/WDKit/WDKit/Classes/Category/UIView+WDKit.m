//
//  UIView+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/4/29.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIView+WDKit.h"
#import <objc/runtime.h>

static const void *ext_topBorderKey;
static const void *ext_leftBorderKey;
static const void *ext_rightBorderKey;
static const void *ext_bottomBorderKey;
static const void *ext_widthKey;

@interface UIView ()
@property (nonatomic, strong) UIView *topBorder;
@property (nonatomic, strong) UIView *leftBorder;
@property (nonatomic, strong) UIView *rightBorder;
@property (nonatomic, strong) UIView *bottomBorder;
@property (nonatomic, assign) CGFloat borderWidth;
@end

@implementation UIView (WDKit)

+ (void)load {
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(ext_layoutSubviews)));
}

- (void)ext_layoutSubviews {
    [self ext_layoutSubviews];

    self.topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), self.borderWidth);
    self.bottomBorder.frame = CGRectMake(0, CGRectGetHeight(self.frame) - self.borderWidth, CGRectGetWidth(self.frame), self.borderWidth);
    self.leftBorder.frame = CGRectMake(0, 0, self.borderWidth, CGRectGetHeight(self.frame));
    self.rightBorder.frame = CGRectMake(CGRectGetWidth(self.frame) - self.borderWidth, 0, self.borderWidth, CGRectGetHeight(self.frame));
}

- (void)setupColorGradientChangeWithSize:(CGSize)size
                               direction:(ViewGradientChangeDirection)direction
                              startColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor {

    if (CGSizeEqualToSize(size,CGSizeZero) || !startcolor || !endColor) {
        return;
    }

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    CGPoint startPoint =CGPointZero;

    if (direction == ViewGradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }

    gradientLayer.startPoint= startPoint;
    CGPoint endPoint = CGPointZero;

    switch(direction) {
        case ViewGradientChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case ViewGradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case ViewGradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case ViewGradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }

    gradientLayer.endPoint = endPoint;
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)setupRoundedRect:(CGRect)rect cornerRadii:(CGSize)cornerRadii byRoundingCorners:(UIRectCorner)byRoundingCorners {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:byRoundingCorners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setupShadowColor:(UIColor *)shadowColor
                 opacity:(CGFloat)opacity
                  offset:(CGSize)offset
            shadowRadius:(CGFloat)shadowRadius {
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = shadowRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, &ext_widthKey, @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)borderWidth {
    NSNumber *num = objc_getAssociatedObject(self, &ext_widthKey);
    return num.floatValue;
}

- (void)setupBoderColor:(UIColor *)color width:(CGFloat)width borderDirection:(ViewBorderDirection)borderDirection {
    self.borderWidth = width;
    
    if (borderDirection & ViewBorderDirectionTop) {
        self.topBorder.backgroundColor = color;
        [self addSubview:self.topBorder];
    }
    
    if (borderDirection & ViewBorderDirectionBottom) {
        self.bottomBorder.backgroundColor = color;
        [self addSubview:self.bottomBorder];
    }
    
    if (borderDirection & ViewBorderDirectionLeft) {
        self.leftBorder.backgroundColor = color;
        [self addSubview:self.leftBorder];
    }
    
    if (borderDirection & ViewBorderDirectionRight) {
        self.rightBorder.backgroundColor = color;
        [self addSubview:self.rightBorder];
    }
    
    if (borderDirection & ViewBorderDirectionAll) {
        self.rightBorder.backgroundColor = color;
        [self addSubview:self.rightBorder];
        
        self.topBorder.backgroundColor = color;
        [self addSubview:self.topBorder];
          
        self.bottomBorder.backgroundColor = color;
        [self addSubview:self.bottomBorder];
          
        self.leftBorder.backgroundColor = color;
        [self addSubview:self.leftBorder];
    }
}

- (UIView *)topBorder {
    UIView *v = objc_getAssociatedObject(self, &ext_topBorderKey);
    if (!v) {
        v = [[UIView alloc] init];
        objc_setAssociatedObject(self, &ext_topBorderKey, v, OBJC_ASSOCIATION_RETAIN);
    }
    return v;
}

- (UIView *)leftBorder {
    UIView *v = objc_getAssociatedObject(self, &ext_leftBorderKey);
    if (!v) {
        v = [[UIView alloc] init];
        objc_setAssociatedObject(self, &ext_leftBorderKey, v, OBJC_ASSOCIATION_RETAIN);
    }
    return v;
}

- (UIView *)rightBorder {
    UIView *v = objc_getAssociatedObject(self, &ext_rightBorderKey);
    if (!v) {
        v = [[UIView alloc] init];
        objc_setAssociatedObject(self, &ext_rightBorderKey, v, OBJC_ASSOCIATION_RETAIN);
    }
    return v;
}

- (UIView *)bottomBorder {
    UIView *v = objc_getAssociatedObject(self, &ext_bottomBorderKey);
    if (!v) {
        v = [[UIView alloc] init];
        objc_setAssociatedObject(self, &ext_bottomBorderKey, v, OBJC_ASSOCIATION_RETAIN);
    }
    return v;
}
@end
