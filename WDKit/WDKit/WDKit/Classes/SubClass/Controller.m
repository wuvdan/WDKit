//
//  Controller.m
//  WDKit
//
//  Created by wudan on 2020/4/28.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "Controller.h"

@interface Controller ()

@end

@implementation Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.title = @"标题";
    [self.view addSubview:self.navigationView];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    UIButton *rightButton1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self.navigationView addRightViews:@[rightButton, rightButton2]];
    
    [self.navigationView addLeftViews:@[rightButton1]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (UIScreen.mainScreen.bounds.size.width < UIScreen.mainScreen.bounds.size.height) {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44 + UIApplication.sharedApplication.statusBarFrame.size.height);
    } else {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44);
    }
    
    [self.view bringSubviewToFront:self.navigationView];
}

- (WDNavigationView *)navigationView {
    if (_navigationView == nil) {
        _navigationView = [[WDNavigationView alloc] init];
    }
    return _navigationView;
}
@end
