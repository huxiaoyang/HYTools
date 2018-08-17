//
//  TouchIdManager.h
//  PersonalLoan
//
//  Created by ucredit-XiaoYang on 16/4/14.
//  Copyright © 2016年 ucredit-XiaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 验证错误码
 LAErrorAuthenticationFailed,   // -1验证信息出错，就是说你指纹不对
 LAErrorUserCancel              // -2用户取消了验证
 LAErrorUserFallback            // -3用户点击了手动输入密码的按钮，所以被取消了
 LAErrorSystemCancel            // -4被系统取消，就是说你现在进入别的应用了，不在刚刚那个页面，所以没法验证
 LAErrorPasscodeNotSet          // -5用户没有设置TouchID
 LAErrorTouchIDNotAvailable     // -6用户设备不支持TouchID
 LAErrorTouchIDNotEnrolled      // -7用户没有设置手指指纹
 LAErrorTouchIDLockout          // -8用户错误次数太多，现在被锁住了
 LAErrorAppCancel               // -9在验证中被其他app中断
 LAErrorInvalidContext          // -10请求验证出错
 */
typedef void(^BSLAEvaluateCallback)(BOOL succes, NSError *error);


@interface BSYLAManager : NSObject

// TouchId/FaceId 不为nil时可用
+ (NSData *)evaluatePolicyData;

// TouchId/FaceId 验证
+ (void)evaluatePolicy:(NSString *)localizedReasion
         fallbackTitle:(NSString *)title
              callback:(BSLAEvaluateCallback)cb;

@end
