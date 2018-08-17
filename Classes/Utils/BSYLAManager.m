//
//  TouchIdManager.m
//  PersonalLoan
//
//  Created by ucredit-XiaoYang on 16/4/14.
//  Copyright © 2016年 ucredit-XiaoYang. All rights reserved.
//

#import "BSYLAManager.h"
#import <LocalAuthentication/LocalAuthentication.h>


@implementation BSYLAManager

+ (NSData *)evaluatePolicyData {
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    BOOL evaluatePolicy = [context canEvaluatePolicy: LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    
    if (evaluatePolicy) {
        return context.evaluatedPolicyDomainState;
    }
    
    if (error) {
        NSLog(@"evaluatePolicy error is: %@", error);
    }
    
    return nil;
}

+ (void)evaluatePolicy:(NSString *)localizedReasion
         fallbackTitle:(NSString *)title
              callback:(BSLAEvaluateCallback)cb {
    
    LAContext *context = [[LAContext alloc] init];
    
    if (title) {
        context.localizedFallbackTitle = title;
    }
    
    NSString *myLocalizedReasonString = localizedReasion;
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
            localizedReason:myLocalizedReasonString
                      reply:cb];
}


@end
