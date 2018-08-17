//
//  NSString+BSKit.m
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import "NSString+BSKit.h"
#import "NSDate+BSKit.h"

@implementation NSString (BSKit)

+ (nullable NSString *)ret32bitString {
    char data[32];
    
    for (int x=0;x < 32; data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    NSString *retString = [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
    NSString *date = [[NSDate date] formatTimeYMDHMS];
    return [NSString stringWithFormat:@"%@%@", retString, date];
}

+ (NSString *)formatFileSize:(NSUInteger)filesize {
    
    if (filesize < 1024) {
        return [NSString stringWithFormat:@"%luB", (unsigned long)filesize];
    }
    
    NSUInteger kb = filesize/1024;
    if (kb < 1024) {
        return [NSString stringWithFormat:@"%luKB", (unsigned long)kb];
    }
    
    NSUInteger mb = kb/1024;
    if (mb < 1024) {
        return [NSString stringWithFormat:@"%luMB", (unsigned long)mb];
    }
    
    NSUInteger gb = mb/1024;
    if (gb < 1024) {
        return [NSString stringWithFormat:@"%luGB", (unsigned long)gb];
    }
    
    NSUInteger tb = gb/1024;
    return [NSString stringWithFormat:@"%luTB", (unsigned long)tb];
}

+ (NSString *)stringWithRounding:(NSString *)number afterPoint:(NSInteger)position {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal = [[NSDecimalNumber alloc] initWithString:number];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init];
    [numFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    
    return [numFormat stringFromNumber:roundedOunces];
}

+ (BOOL)isEmpty:(NSString *)string {
    if (string == nil) return YES;
    if (string == NULL) return YES;
    if ([string isEqualToString:@"\n"]) return YES;
    if ([string isKindOfClass:[NSNull class]]) return YES;
    if ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) return YES;
    return NO;
}

@end
