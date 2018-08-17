//
//  BSTimer.h
//  void_tools
//
//  Created by ucredit-XiaoYang on 2017/8/3.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSYTimer : NSObject


+ (BSYTimer *)timerWithTimeInterval:(NSTimeInterval)interval
                            target:(id)target
                          selector:(SEL)selector
                           repeats:(BOOL)repeats;

- (instancetype)initWithFireTime:(NSTimeInterval)start
                        interval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                         repeats:(BOOL)repeats NS_DESIGNATED_INITIALIZER;

@property (readonly) BOOL repeats;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;

- (void)invalidate;

- (void)fire;


@end

NS_ASSUME_NONNULL_END
