//
//  RHProgressView.m
//  RHKit
//
//  Created by Abner_G on 2017/10/13.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "RHProgressView.h"

#define RH_Screen_Width       [UIScreen mainScreen].bounds.size.width
#define RH_ScaleSize          RH_Screen_Width / 375
#define RH_SS(a)              RH_ScaleSize * (a)
@interface RHProgressView ()

@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UIActivityIndicatorView * activity;
@end
@implementation RHProgressView

- (instancetype)initWithFrame:(CGRect)frame tip:(NSString *)tip {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [self addSubviewsWithTip:tip];
    }
    return self;
}

- (void)addSubviewsWithTip:(NSString *)tip {
    
    [self addSubview:self.bgView];
    _bgView.frame = CGRectMake(0, 0, RH_SS(80), RH_SS(80));
    [_bgView addSubview:self.activity];
    _activity.frame = CGRectMake(0, RH_SS(20), RH_SS(40), RH_SS(40));
    _activity.center = CGPointMake(_bgView.center.x, _activity.center.y);
    
    if (tip && tip.length > 0) {
        
        UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, RH_SS(60), RH_SS(80), RH_SS(41))];
        textView.textContainerInset = UIEdgeInsetsMake(RH_SS(10), RH_SS(10), RH_SS(15), RH_SS(10));
        textView.font = [UIFont systemFontOfSize:RH_SS(15)];
        textView.textColor = [UIColor whiteColor];
        textView.textAlignment = NSTextAlignmentCenter;
        textView.editable = NO;
        textView.text = tip;
        textView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        CGFloat bgWidth = RH_SS(80);
        CGFloat width = [self getTextViewWidthByText:tip font:textView.font];
        if (width > RH_SS(80)) {
            
            if (width > RH_SS(180)) {
                
                CGFloat height = [self getTextViewHeightByText:tip font:textView.font width:RH_SS(180)];
                textView.frame = CGRectMake(0, RH_SS(60), RH_SS(180), height);
                bgWidth = RH_SS(180);
            } else {
                
                bgWidth = width;
                textView.frame = CGRectMake(0, RH_SS(60), width, RH_SS(41));
            }
        }
        _bgView.frame = CGRectMake(0, 0, bgWidth, RH_SS(60) + textView.frame.size.height);
        textView.center = CGPointMake(_bgView.center.x, textView.center.y);
        _activity.center = CGPointMake(_bgView.center.x, _activity.center.y);
        [_bgView addSubview:textView];
    }
    CGFloat width = self.frame.size.width > 0 ? self.frame.size.width : [UIScreen mainScreen].bounds.size.width;
    CGFloat height = self.frame.size.height > 0 ? self.frame.size.height : [UIScreen mainScreen].bounds.size.height;
    _bgView.center = CGPointMake(width/2, height/2);
}

#pragma mark - private

- (CGFloat)getTextViewWidthByText:(NSString *)text font:(UIFont *)font {
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, MAXFLOAT, 0)];
    textView.textContainerInset = UIEdgeInsetsMake(RH_SS(10), RH_SS(10), RH_SS(15), RH_SS(10));
    textView.text = text;
    textView.font = font;
    textView.editable = NO;
    [textView sizeToFit];
    CGFloat width = textView.frame.size.width;
    return width;
}

- (CGFloat)getTextViewHeightByText:(NSString *)text font:(UIFont *)font width:(CGFloat)width {
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    textView.textContainerInset = UIEdgeInsetsMake(RH_SS(10), RH_SS(10), RH_SS(15), RH_SS(10));
    textView.text = text;
    textView.font = font;
    textView.editable = NO;
    [textView sizeToFit];
    CGFloat height = textView.frame.size.height;
    return height;
}

#pragma mark - setter and getter

- (UIView *)bgView {
    
    if (!_bgView) {
        
        UIView * view = [[UIView alloc] init];
        view.layer.cornerRadius = RH_SS(8);
        view.clipsToBounds = YES;
        view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.85];
        _bgView = view;
    }
    return _bgView;
}

- (UIActivityIndicatorView *)activity {
    
    if (!_activity) {
        
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] init];
        activity.color = [UIColor blackColor];
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [activity startAnimating];
        _activity = activity;
    }
    return _activity;
}

@end
