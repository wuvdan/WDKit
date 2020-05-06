//
//  ViewController.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "ViewController.h"
#import "UIKitHeader.h"
#import <Masonry.h>
#import "TestViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationView.title = @"标题";
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithHandle:^{
        
    }]];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];

    
    [rightButton setupBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setupBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];

    
    UIButton *rightButton1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightButton1 addHandle:^(UIControl * _Nonnull sender) {
        
    }];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self.navigationView addRightViews:@[rightButton, rightButton2]];
    
    [self.navigationView addLeftViews:@[rightButton1]];
    
        
    self.testView = [[UIView alloc] init];
    self.testView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.testView];
    
    self.textView = [[UITextView alloc] init];
    
    self.textView.placeholder = @"请输入内容。。。";
    self.textView.placeholderColor = [UIColor redColor];
    self.textView.font = [UIFont systemFontOfSize:15];
    [self.textView setupShadowColor:[UIColor redColor] opacity:0.8 offset:CGSizeMake(5, 5) shadowRadius:5];
    [self.view addSubview:self.textView];
    
    self.textField = [[UITextField alloc] init];
    [self.textField setupPlaceholder:@"请输入内容" textColor:[UIColor redColor]];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.imageView = [[UIImageView alloc] init];
    UIImage *image = [UIImage templateNamed:@"1"];
    self.imageView.image = image;
    self.imageView.tintColor = [UIColor systemTealColor];
    [self.view addSubview:self.imageView];
    
    self.button = [[UIButton alloc] init];
    [self.button setImage:[UIImage imageNamed:@"yuedu"] forState:UIControlStateNormal];
    [self.button setTitle:@"按钮文字" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor clearColor];
    [self.button setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.button];
    
    [self.button setupButtonImageStyle:ButtonImageStyleTop spacing:7];
    

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (UIScreen.mainScreen.bounds.size.width < UIScreen.mainScreen.bounds.size.height) {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44 + UIApplication.sharedApplication.statusBarFrame.size.height);
    } else {
        self.navigationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44);
    }

    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];

    [self.view bringSubviewToFront:self.navigationView];

    self.testView.frame = CGRectMake(100, 100, 100, 100);

    [self.testView setupRoundedRect:self.testView.bounds cornerRadii:CGSizeMake(20, 20) byRoundingCorners:(UIRectCornerAllCorners)];

    self.textView.frame = CGRectMake(100, 250, 300, 100);

    self.textField.frame = CGRectMake(100, 360, 300, 50);

    self.imageView.frame = CGRectMake(15, 100, 30, 30);

    [self.textView setupBoderColor:[UIColor redColor] width:1 borderDirection:ViewBorderDirectionAll];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
