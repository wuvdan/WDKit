//
//  UINavigationController+WDKit.h
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (WDKit)
- (UIStatusBarStyle)preferredStatusBarStyle;
- (BOOL)prefersStatusBarHidden;
@end

NS_ASSUME_NONNULL_END
