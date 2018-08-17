//
//  NSDate+BSKit.h
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BSKit)

- (NSString *)formatTime;
- (NSString *)formatTimeWithWeekdays;
- (NSString *)formatTimeYMD;
- (NSString *)formatTimeYMDHMS;
- (NSString *)formatTimeYMDHM;
- (NSString *)formatTimeMD;
- (NSString *)formatTimeTimeLine;

- (NSString *)formatRemainingTime;

@end
