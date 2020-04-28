//
//  View.h
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, ViewBorderDirection) {
    ViewBorderDirectionTop = 1 << 0,
    ViewBorderDirectionBottom = 1 << 1,
    ViewBorderDirectionLeft = 1 << 2,
    ViewBorderDirectionRight = 1 << 3,
    ViewBorderDirectionAll = 1 << 4,
};


@interface View : UIView
- (void)setupBoderColor:(UIColor *)color borderDirection:(ViewBorderDirection)borderDirection;
@end

NS_ASSUME_NONNULL_END
