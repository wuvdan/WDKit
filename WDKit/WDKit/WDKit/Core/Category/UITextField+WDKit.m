//
//  UITextField+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UITextField+WDKit.h"

@implementation UITextField (WDKit)
- (void)setupPlaceholder:(NSString *)placeholder textColor:(UIColor *)color {
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                 attributes:@{NSForegroundColorAttributeName : color}];
}
@end
