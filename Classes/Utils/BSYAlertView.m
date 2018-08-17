//
//  BSYAlertView.m
//  HYTools
//
//  Created by void on 2018/8/17.
//  Copyright © 2018年 void. All rights reserved.
//

#import "BSYAlertView.h"
#import "UIViewController+CurrentVC.h"


@implementation BSYAlertView

+ (UIAlertController *)alertViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    for (UIAlertAction *action in actions) {
        [VC addAction:action];
    }
    
    return VC;
}

+ (UIAlertController *)alertViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                             actionTitles:(NSArray *)titles
                                  handler:(BSYAlertViewComplate)block {
    
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:titles.count];

    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (block) {
                                                               block(action, idx);
                                                           }
                                                       }];
        
        [actions addObject:action];
    }];
    
    return [BSYAlertView alertViewWithTitle:title
                                    message:message
                                    actions:actions.copy];
}


#pragma mark - show methods

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [BSYAlertView alertViewWithTitle:title
                                                     message:message
                                                     actions:actions];
    
    [[UIViewController bs_currentViewController] presentViewController:VC animated:YES completion:nil];
    
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray *)titles
                   handler:(BSYAlertViewComplate)block {
    
    UIAlertController *VC = [BSYAlertView alertViewWithTitle:title
                                                     message:message
                                                actionTitles:titles
                                                     handler:block];
    
    [[UIViewController bs_currentViewController] presentViewController:VC animated:YES completion:nil];
    
}

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



@implementation UIViewController (BSYAlertView)

- (void)alertViewWithTitle:(NSString *)title
                   message:(NSString *)message
                   actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [BSYAlertView alertViewWithTitle:title
                                                     message:message
                                                     actions:actions];
    
    [self presentViewController:VC animated:YES completion:nil];
    
}

- (void)alertViewWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray *)titles
                   handler:(BSYAlertViewComplate)block {
    
    UIAlertController *VC = [BSYAlertView alertViewWithTitle:title
                                                     message:message
                                                actionTitles:titles
                                                     handler:block];
    
    [self presentViewController:VC animated:YES completion:nil];
    
}

@end
