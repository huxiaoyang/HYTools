//
//  BSConversion.h
//  void_tools
//
//  Created by ucredit-XiaoYang on 2017/6/2.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//
//  类型转换操作


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


static inline NSDecimalNumber *NSDecimalNumberFromNumber(NSNumber *value) {
    double number = value.doubleValue;
    NSString *doubleString = [NSString stringWithFormat:@"%lf", number];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return decNumber;
}


NS_ASSUME_NONNULL_END
