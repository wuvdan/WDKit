//
//  UIView+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/4/29.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIView+WDKit.h"

@implementation UIView (WDKit)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

CGFloat kSuitWidthSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.width / 375.f) * value;
}

CGFloat kSuitHeightSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.height / 667.f) * value;
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

- (void)setupBoderColor:(UIColor *)color width:(CGFloat)width borderDirection:(ViewBorderDirection)borderDirection {
    
    if (borderDirection & ViewBorderDirectionTop) {
        CALayer *border = [CALayer layer];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, width);
        [self.layer addSublayer:border];
    }
    
    if (borderDirection & ViewBorderDirectionBottom) {
        CALayer *border = [CALayer layer];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0.0f, self.bounds.size.height - width, self.bounds.size.width, width);
        [self.layer addSublayer:border];
    }
    
    if (borderDirection & ViewBorderDirectionLeft) {
        CALayer *border = [CALayer layer];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0.0f,0.0f, width,self.bounds.size.height);
        [self.layer addSublayer:border];
    }
    
    if (borderDirection & ViewBorderDirectionRight) {
        CALayer *border = [CALayer layer];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
        [self.layer addSublayer:border];
    }
    
    if (borderDirection & ViewBorderDirectionAll) {
        CALayer *border1 = [CALayer layer];
        border1.backgroundColor = color.CGColor;
        border1.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, width);
        [self.layer addSublayer:border1];
        
        CALayer *border2 = [CALayer layer];
        border2.backgroundColor = color.CGColor;
        border2.frame = CGRectMake(0.0f, self.bounds.size.height - width, self.bounds.size.width, width);
        [self.layer addSublayer:border2];
        
        CALayer *border3 = [CALayer layer];
        border3.backgroundColor = color.CGColor;
        border3.frame = CGRectMake(0.0f,0.0f, width,self.bounds.size.height);
        [self.layer addSublayer:border3];
        
        CALayer *border = [CALayer layer];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
        [self.layer addSublayer:border];
    }
}

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIViewController *)viewController{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
