//
//  UIControl+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ControlEventHandle)(UIControl *sender);

@interface UIControl (WDKit)

/// 点击事件block回调
/// @param handle 回调
- (void)addHandle:(ControlEventHandle)handle;

/// 点击事件block回调
/// @param handle 回调
/// @param controlEvents 制定对应的状态
- (void)addHandle:(ControlEventHandle)handle controlEvents:(UIControlEvents)controlEvents;

@end

typedef void(^TapGestureRecognizerHandle)(void);

@interface UITapGestureRecognizer (WDKit)

/// 初始化
/// @param handle 点击回调
- (instancetype)initWithHandle:(TapGestureRecognizerHandle)handle;
@end

NS_ASSUME_NONNULL_END
