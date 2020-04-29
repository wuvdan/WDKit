//
//  TextView.m
//  AllDemo-ObjC
//
//  Created by wudan on 2020/4/23.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "TextView.h"

@interface TextView ()
@property (nonatomic, strong) UILabel *placeLabel;
@end

@implementation TextView
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.placeLabel];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

#pragma mark - update
- (void)updatePlaceHolder {
    if (self.text.length > 0) {
        [self.placeLabel removeFromSuperview];
        return;
    }
    self.placeLabel.font = self.font ? self.font : self.cacutDefaultFont;
    self.placeLabel.textAlignment = self.textAlignment;
    self.placeLabel.text = self.placeholder;
    [self insertSubview:self.placeLabel atIndex:0];
}

#pragma mark - lazy
- (UILabel *)placeLabel {
    if (!_placeLabel) {
        _placeLabel = [[UILabel alloc] init];
        _placeLabel.numberOfLines = 0;
        _placeLabel.textColor = [UIColor lightGrayColor];
    }
    return _placeLabel;
}
- (UIFont *)cacutDefaultFont {
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeLabel.text = placeholder;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    self.placeLabel.textColor = placeHolderColor;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    if (self.placeLabel) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2 * self.layer.borderWidth;
        CGFloat height = [self.placeLabel sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height;
        self.placeLabel.frame = CGRectMake(x, y, width, height);
    }
    [super layoutSubviews];

}
@end
