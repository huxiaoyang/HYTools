//
//  BSYSheetView.h
//  HYTools
//
//  Created by void on 2018/8/17.
//  Copyright © 2018年 void. All rights reserved.
//

#import <UIKit/UIKit.h>

/// sheetView action实体协议
@protocol BSYSheetViewProtocol <NSObject>

- (NSString *)sheetActionTitle;

@end


typedef void (^BSYSheetViewComplate) (UIAlertAction *action, NSUInteger index);


@interface BSYSheetView : NSObject

/**
 UIAlertController生成器 - 自定义actions
 
 @param title 标题
 @param message 描述
 @param actions 按钮事件集合
 @return UIAlertController实例
 */
+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray<UIAlertAction *> *)actions;


/**
 UIAlertController生成器 - 自定义actionTitles

 @param title 标题
 @param message 描述
 @param titles action titles
 @param cancelTitle 取消按钮
 @param block 按钮事件回调
 @return UIAlertController实例
 */
+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                   titles:(NSArray<NSString *> *)titles
                              cancelTitle:(NSString *)cancelTitle
                                  handler:(BSYSheetViewComplate)block;


/**
 UIAlertController生成器 - 自定义遵守 <BSYSheetViewProtocol> 协议的实体集合，从中获取sheetActionTitle

 @param title 标题
 @param message 描述
 @param entities 实体集合
 @param cancelTitle 取消按钮
 @param block 按钮事件回调
 @return UIAlertController实例
 */
+ (UIAlertController *)sheetViewWithTitle:(NSString *)title
                                  message:(NSString *)message
                                 entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                              cancelTitle:(NSString *)cancelTitle
                                  handler:(void (^)(id<BSYSheetViewProtocol>))block;


#pragma mark - show方法，获取最上层controller

/// 自定义actions -> show sheetView
+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                       actions:(NSArray<UIAlertAction *> *)actions;

/// 自定义actionTitles -> show sheetView
+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                        titles:(NSArray *)titles
                   cancelTitle:(NSString *)cancelTitle
                       handler:(BSYSheetViewComplate)block;

/// 自定义entities -> show sheetView
+ (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                      entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                   cancelTitle:(NSString *)cancelTitle
                       handler:(void (^)(id<BSYSheetViewProtocol>))block;

@end



@interface UIViewController (BSYSheetView)

/// 自定义actions -> show sheetView
- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                       actions:(NSArray<UIAlertAction *> *)actions;

/// 自定义actionTitles -> show sheetView
- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                        titles:(NSArray *)titles
                   cancelTitle:(NSString *)cancelTitle
                       handler:(BSYSheetViewComplate)block;

/// 自定义entities -> show sheetView
- (void)showSheetViewWithTitle:(NSString *)title
                       message:(NSString *)message
                      entities:(NSArray<id<BSYSheetViewProtocol>> *)entities
                   cancelTitle:(NSString *)cancelTitle
                       handler:(void (^)(id<BSYSheetViewProtocol>))block;

@end

