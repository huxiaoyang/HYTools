//
//  BSYSheetView.m
//  HYTools
//
//  Created by void on 2018/8/17.
//  Copyright © 2018年 void. All rights reserved.
//

#import "BSYSheetView.h"
#import "UIViewController+CurrentVC.h"


@implementation BSYSheetView

+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (UIAlertAction *action in actions) {
        [VC addAction:action];
    }
    
    return VC;
}


+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                   titles:(NSArray<NSString *> *)titles
                                  handler:(BSYSheetViewComplate)block {
    
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:titles.count];
    
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (block) block(action, idx);
                                                       }];
        [actions addObject:action];
        
    }];
    
    return [BSYSheetView sheetViewWithTitle:title message:message actions:actions];
    
}

+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                 entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                                  handler:(void (^)(id<BSYSheetViewProtocol>))block {
    
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:entities.count];
    
    [entities enumerateObjectsUsingBlock:^(id<BSYSheetViewProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *actionTitle = obj.sheetActionTitle;
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (block) block(obj);
                                                       }];
        [actions addObject:action];
        
    }];
    
    return [BSYSheetView sheetViewWithTitle:title
                                    message:message
                                    actions:actions];
    
}


#pragma mark - show methods

+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                       actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                     actions:actions];
    
    [[UIViewController bs_currentViewController] presentViewController:VC animated:YES completion:nil];
    
}


+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                        titles:(NSArray *)titles
                       handler:(BSYSheetViewComplate)block {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                      titles:titles
                                                     handler:block];
    
    [[UIViewController bs_currentViewController] presentViewController:VC animated:YES completion:nil];
    
}

+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                      entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                       handler:(void (^)(id<BSYSheetViewProtocol>))block {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                    entities:entities
                                                     handler:block];
    
    [[UIViewController bs_currentViewController] presentViewController:VC animated:YES completion:nil];
    
}

@end



@implementation UIViewController (BSYSheetView)

- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                       actions:(NSArray<UIAlertAction *> *)actions {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                     actions:actions];
    
    [self presentViewController:VC animated:YES completion:nil];
    
}


- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                        titles:(NSArray *)titles
                       handler:(BSYSheetViewComplate)block {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                      titles:titles
                                                     handler:block];
    
    [self presentViewController:VC animated:YES completion:nil];
    
}

- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                      entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                       handler:(void (^)(id<BSYSheetViewProtocol>))block {
    
    UIAlertController *VC = [BSYSheetView sheetViewWithTitle:title
                                                     message:message
                                                    entities:entities
                                                     handler:block];
    
    [self presentViewController:VC animated:YES completion:nil];
    
}

@end

