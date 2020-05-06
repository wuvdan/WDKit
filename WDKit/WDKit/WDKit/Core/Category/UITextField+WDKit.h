//
//  UITextField+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WDKit)
/// 设置占位字符和字体颜色
/// @param placeholder 占位字符
/// @param color 字体颜色
- (void)setupPlaceholder:(NSString *)placeholder textColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
