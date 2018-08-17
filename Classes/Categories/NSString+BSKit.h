//
//  NSString+BSKit.h
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSString (BSKit)


/**
 随机生成32位字符串
 */
+ (nullable NSString *)ret32bitString;


/**
 Format the file size
 */
+ (nullable NSString *)formatFileSize:(NSUInteger)filesize;

/**
 给数目加逗号
 
 @param number 传入值
 @param position 小数点位数
 @return 带逗号的String
 */
+ (nullable NSString *)stringWithRounding:(NSString *)number
                               afterPoint:(NSInteger)position;


/**
 字符串是否为空

 @param string 待判断字符传
 @return @"", @" ", @"\n", nil, NULL 返回YES
 */
+ (BOOL)isEmpty:(NSString *)string;

@end

