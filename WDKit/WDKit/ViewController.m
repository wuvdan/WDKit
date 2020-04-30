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
@property (nonatomic, strong) TextView *textView;
@property (nonatomic, strong) TextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.title = @"标题";
    [self.view addSubview:self.navigationView];
    
    Button *rightButton = [Button buttonWithType:UIButtonTypeInfoLight];
    [rightButton handleEventBlock:^(UIButton * _Nonnull sender) {
        NSLog(@"=====");
    }];
    
    
    [rightButton setupBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setupBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [rightButton setupBackgroundColor:[UIColor orangeColor] forState:UIControlStateSelected];

    
    UIButton *rightButton1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self.navigationView addRightViews:@[rightButton, rightButton2]];
    
    [self.navigationView addLeftViews:@[rightButton1]];
    
        
    
    self.testView = [[View alloc] init];
    self.testView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.testView];
    
    self.textView = [[TextView alloc] init];
    self.textView.placeholder = @"1111";
    [self.textView setupBoderColor:[UIColor redColor] width:1 borderDirection:ViewBorderDirectionAll];
    self.textView.font = [UIFont systemFontOfSize:15];
    [self.textView setupShadowColor:[UIColor redColor] opacity:0.8 offset:CGSizeMake(5, 5) shadowRadius:5];
    [self.view addSubview:self.textView];
    
    self.textField = [[TextField alloc] init];
    [self.textField setupPlaceholder:@"请输入内容" textColor:[UIColor redColor]];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
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
    
    [self.testView setupRoundedRect:self.testView.bounds cornerRadii:CGSizeMake(20, 20) byRoundingCorners:(UIRectCornerAllCorners)];
    
    self.textView.frame = CGRectMake(100, 250, 300, 100);
    
    self.textField.frame = CGRectMake(100, 360, 300, 50);

}

- (WDNavigationView *)navigationView {
    if (_navigationView == nil) {
        _navigationView = [[WDNavigationView alloc] init];
    }
    return _navigationView;
}
@end
