//
//  Button.h
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonEventBlock)(UIButton *sender);

@interface Button : UIButton

/// 点击事件（默认`UIControlEventTouchUpInside`）
/// @param block 回调当前的Button
- (void)handleEventBlock:(ButtonEventBlock)block;

/// 点击事件
/// @param events 指定`UIControlEvents`
/// @param block 回调当前的`Button`
- (void)handleEvent:(UIControlEvents)events tappedBlock:(ButtonEventBlock)block;


/// 设置背景颜色
/// @param color 颜色
/// @param state 状态
- (void)setupBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end


NS_ASSUME_NONNULL_END
