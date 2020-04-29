//
//  Label.h
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Label : UILabel
+ (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont;
+ (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)textFont numOfLines:(NSUInteger)numOfLines;
@end

NS_ASSUME_NONNULL_END
