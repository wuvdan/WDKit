//
//  UIControl+WDKit.m
//  WDKit
//
//  Created by wudan on 2020/5/6.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "UIControl+WDKit.h"
#import <objc/runtime.h>

static char *kUIControlHandelKey = "UIControl.WDKit.Key";


@implementation UIControl (WDKit)
- (void)addHandle:(ControlEventHandle)handle {
    [self addHandle:handle controlEvents:UIControlEventTouchUpInside];
}

- (void)addHandle:(ControlEventHandle)handle controlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, kUIControlHandelKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(handleControlEvent:) forControlEvents:controlEvents];
}

- (void)handleControlEvent:(UIControl *)sender {
    ControlEventHandle handle = objc_getAssociatedObject(self, kUIControlHandelKey);
    if (handle) {
        handle(sender);
    }
}
@end

static char *kUITapGestureRecognizerKey = "UITapGestureRecognizer.WDKit.Key";

@implementation UITapGestureRecognizer (WDKit)
- (instancetype)initWithHandle:(TapGestureRecognizerHandle)handle {
    self = [super init];
    if (self) {
        [self addActionHandle:handle];
        [self addTarget:self action:@selector(handleTapGestureRecognizer:)];
    }
    return self;
}

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer {
    TapGestureRecognizerHandle handle = objc_getAssociatedObject(self, kUITapGestureRecognizerKey);
    if (handle) {
        handle();
    }
}

- (void)addActionHandle:(TapGestureRecognizerHandle)handle {
    if (handle) {
        objc_setAssociatedObject(self, kUITapGestureRecognizerKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
@end
