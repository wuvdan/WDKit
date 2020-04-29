//
//  TextView.h
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeHolderColor;
@end

NS_ASSUME_NONNULL_END
