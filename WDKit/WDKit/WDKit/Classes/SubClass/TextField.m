//
//  TextField.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "TextField.h"

@implementation TextField
- (void)setupPlaceholder:(NSString *)placeholder textColor:(UIColor *)color {
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                 attributes:@{NSForegroundColorAttributeName : color}];
}
@end
