//
//  NSDate+Report.h
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Report)

// Return a date with a specified year, month and day.
+ (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day;

// Return midnight on the specified date.
+ (NSDate *)midnightOfDate:(NSDate *)date;

// Return midnight today.
+ (NSDate *)midnightToday;

// Return midnight tomorrow.
+ (NSDate *)midnightTomorrow;

// Returns a date that is exactly 1 day after the specified date. Does *not*
// zero out the time components. For example, if the specified date is
// April 15 2012 10:00 AM, the return value will be April 16 2012 10:00 AM.
+ (NSDate *)oneDayAfter:(NSDate *)date;

// Returns midnight of the first day of the current, previous or next Month.
// Note: firstDayOfNextMonth returns midnight of the first day of next month,
// which is effectively the same as the "last moment" of the current month.
+ (NSDate *)firstDayOfCurrentMonth;
+ (NSDate *)firstDayOfPreviousMonth;
+ (NSDate *)firstDayOfNextMonth;

// Returns midnight of the first day of the current, previous or next Quarter.
// Note: firstDayOfNextQuarter returns midnight of the first day of next quarter,
// which is effectively the same as the "last moment" of the current quarter.
+ (NSDate *)firstDayOfCurrentQuarter;
+ (NSDate *)firstDayOfPreviousQuarter;
+ (NSDate *)firstDayOfNextQuarter;

// Returns midnight of the first day of the current, previous or next Year.
// Note: firstDayOfNextYear returns midnight of the first day of next year,
// which is effectively the same as the "last moment" of the current year.
+ (NSDate *)firstDayOfCurrentYear;
+ (NSDate *)firstDayOfPreviousYear;
+ (NSDate *)firstDayOfNextYear;


+ (NSDate *)firstDayOfCurrentMonth:(NSDate *)date;
+ (NSDate *)firstDayOfNextMonth:(NSDate *)date;


@end
