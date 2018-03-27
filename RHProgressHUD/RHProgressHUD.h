//
//  RHProgressHUD.h
//  RHKit
//
//  Created by Abner_G on 2017/9/8.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHProgressHUD : NSObject

/**
 添加hud
 
 @param targetView  要添加的view
 @param tip         显示的文字
 */
+ (void)showHudOnView:(UIView *)targetView tip:(NSString *)tip;

/**
 移除hud
 
 @param targetView  hud所在的view
 */
+ (void)removeFromView:(UIView *)targetView;

@end
