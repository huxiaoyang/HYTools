//
//  BSYAlertView.h
//  HYTools
//
//  Created by void on 2018/8/17.
//  Copyright © 2018年 void. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BSYAlertViewComplate) (UIAlertAction *action, NSUInteger index);

@interface BSYAlertView : NSObject

/**
 UIAlertController生成器 - 自定义actions
 
 @param title 标题
 @param message 描述
 @param actions 按钮事件集合
 @return UIAlertController实例
 */
+ (UIAlertController *)alertViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray<UIAlertAction *> *)actions;

/**
 UIAlertController生成器 - 自定义actionTitles生成actions
 
 @param title 标题
 @param message 描述
 @param titles action数组 - 按钮title
 @param block 按钮事件
 @return UIAlertController实例
 */
+ (UIAlertController *)alertViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                             actionTitles:(NSArray *)titles
                                  handler:(BSYAlertViewComplate)block;


#pragma mark - show方法，获取最上层controller

/// 自定义actions -> show alertView
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   actions:(NSArray<UIAlertAction *> *)actions;

/// 自定义actionTitles -> show alertView
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray *)titles
                   handler:(BSYAlertViewComplate)block;
@end



@interface UIViewController (BSYAlertView)

/**
 UIAlertController生成器 - 自定义actions
 
 @param title 标题
 @param message 描述
 @param actions 按钮事件集合
 */
- (void)alertViewWithTitle:(NSString *)title
                   message:(NSString *)message
                   actions:(NSArray<UIAlertAction *> *)actions;

/**
 UIAlertController生成器 - 自定义actionTitles生成actions
 
 @param title 标题
 @param message 描述
 @param titles action数组 - 按钮title
 @param block 按钮事件
 */
- (void)alertViewWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray *)titles
                   handler:(BSYAlertViewComplate)block;

@end
