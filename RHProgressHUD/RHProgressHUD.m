//
//  RHProgressHUD.m
//  RHKit
//
//  Created by Abner_G on 2017/9/8.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "RHProgressHUD.h"
#import "RHProgressView.h"

@implementation RHProgressHUD

/**
 添加hud

 @param targetView  要添加的view
 @param tip         显示的文字
 */
+ (void)showHudOnView:(UIView *)targetView tip:(NSString *)tip {
    
    [self removeFromView:targetView];
    RHProgressView * progressView = [[RHProgressView alloc] initWithFrame:CGRectMake(0, 0, targetView.frame.size.width, targetView.frame.size.height) tip:tip];
    [targetView addSubview:progressView];
}

/**
 移除hud

 @param targetView  hud所在的view
 */
+ (void)removeFromView:(UIView *)targetView {
    
    for (UIView * view in targetView.subviews) {
        
        if ([view isKindOfClass:[RHProgressView class]]) {
            
            [view removeFromSuperview];
            break;
        }
    }
}


@end
