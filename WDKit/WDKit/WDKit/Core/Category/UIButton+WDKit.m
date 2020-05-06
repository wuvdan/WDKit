//
//  UIButton+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIButton+WDKit.h"

@implementation UIButton (WDKit)

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font {
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imageNamed:(NSString *)imageNamed font:(UIFont *)font {
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
    }
    return self;
}

- (void)setupBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[self imageWithColor:color] forState:state];
}

- (void)setupButtonImageStyle:(ButtonImageStyle)style spacing:(CGFloat)spacing {
    
    self.titleEdgeInsets = self.imageEdgeInsets = UIEdgeInsetsZero;

    CGFloat imgW = self.imageView.image.size.width;
    CGFloat imgH = self.imageView.image.size.height;
    CGSize showLabSize = self.titleLabel.bounds.size;
    CGFloat showLabW = showLabSize.width;
    CGFloat showLabH = showLabSize.height;

    CGSize trueSize = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat trueLabW = trueSize.width;

    CGFloat imageOffsetX = showLabW / 2;
    CGFloat imageOffsetY = showLabH / 2 + spacing / 2;
    CGFloat labelOffsetX1 = imgW / 2 - showLabW / 2 + trueLabW / 2;
    CGFloat labelOffsetX2 = fabs(imgW / 2 + showLabW / 2 - trueLabW / 2);
    CGFloat labelOffsetY = imgH / 2 + spacing / 2;

    switch (style) {
        case ButtonImageStyleLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing / 2, 0, spacing / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, -spacing / 2);
            break;
        case ButtonImageStyleRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, showLabW + spacing / 2, 0, -(showLabW + spacing / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imgW + spacing / 2), 0, imgW + spacing / 2);
            break;
        case ButtonImageStyleTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX1, -labelOffsetY, labelOffsetX2);
            break;
        case ButtonImageStyleBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX1, labelOffsetY, labelOffsetX2);
            break;
        default:
            break;
    }
}

#pragma mark - Private Method
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
