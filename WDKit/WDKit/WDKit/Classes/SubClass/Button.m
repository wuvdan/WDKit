//
//  Button.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "Button.h"

@interface Button ()
@property(nonatomic, copy) ButtonEventBlock eventBlock;
@property(nonatomic, strong) NSMutableDictionary *colors;
@end

@implementation Button

- (instancetype)init{
    if (self = [super init]) {
        _colors = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)handleEventBlock:(ButtonEventBlock)block {
    [self handleEvent:UIControlEventTouchUpInside tappedBlock:block];
}

- (void)handleEvent:(UIControlEvents)events tappedBlock:(ButtonEventBlock)block {
    self.eventBlock = block;
    [self addTarget:self action:@selector(handleButtonEvent:) forControlEvents:events];
}

- (void)handleButtonEvent:(UIButton *)sender {
    if (self.eventBlock) {
        self.eventBlock(sender);
    }
}

- (void)setupBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[self imageWithColor:color] forState:state];
}

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
