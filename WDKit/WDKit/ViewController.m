//
//  ViewController.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "ViewController.h"
#import "UIKitHeader.h"

@interface ViewController ()
@property (nonatomic, strong) View *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.title = @"标题";
    [self.view addSubview:self.navigationView];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    UIButton *rightButton1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self.navigationView addRightViews:@[rightButton, rightButton2]];
    
    [self.navigationView addLeftViews:@[rightButton1]];
    
    
    
    self.testView = [[View alloc] init];
    [self.testView setupBoderColor:[UIColor redColor] borderDirection:(ViewBorderDirectionAll)];
    self.testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (UIScreen.mainScreen.bounds.size.width < UIScreen.mainScreen.bounds.size.height) {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44 + UIApplication.sharedApplication.statusBarFrame.size.height);
    } else {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44);
    }
    
    [self.view bringSubviewToFront:self.navigationView];
    
    self.testView.frame = CGRectMake(100, 100, 100, 100);
}

- (WDNavigationView *)navigationView {
    if (_navigationView == nil) {
        _navigationView = [[WDNavigationView alloc] init];
    }
    return _navigationView;
}
@end
