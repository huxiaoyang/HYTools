//
//  UIResponder+Keypath.h
//  HYTools
//
//  Created by void on 2018/8/29.
//  Copyright © 2018年 void. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Xpath)

/**
 起点是 UIApplication 的路径
 */
- (NSString *)bs_xpath;


/**
 求当前view 的事件路径

 @param className viewTree停止的节点
 @return 全路径 例："className_UIController[0]_UIView[0]_UILabel[0]"
 */
- (NSString *)bs_xpathWithNodeClassName:(NSString *)className;

@end
