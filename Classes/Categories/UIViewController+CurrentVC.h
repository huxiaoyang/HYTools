//
//  UIViewController+CurrentVC.h
//  PersonalLoan
//
//  Created by ucredit-XiaoYang on 16/3/8.
//  Copyright © 2016年 ucredit-XiaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentVC)

/**
 *  获取当前Window页面
 *
 *  @return 一般是UINavigationCtontroller
 */
+ (UIViewController *)bs_getCurrentVC;


/**
 *  获取当前Window页面
 *
 *  @return 精确到Controller
 */
+ (UIViewController *)bs_currentViewController;


/**
 获取当前 view 的 Controller

 @param view 目标 view
 @return view的控制器
 */
+ (NSString *)bs_currentController:(UIView *)view;

@end
