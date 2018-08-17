//
//  BSTimerView.h
//  void_tools
//
//  Created by ucredit-XiaoYang on 2017/9/15.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BSYTimerViewDelegate;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BSTimerViewState) {
    BSTimerViewStateNormal,     // 默认状态
    BSTimerViewStateCounting,   // 计时中
    BSTimerViewStateDisabled,   // 无法响应
};


typedef NS_ENUM(NSUInteger, BSTimerViewType) {
    BSTimerViewTypeBackward,    // 倒计时
    BSTimerViewTypeForward,     // 正计时
};

@interface BSYTimerView : UIView

@property (nonatomic, weak) id <BSYTimerViewDelegate> delegate;

@property (nonatomic, assign) NSInteger count; // 计时时间（秒）
@property (nonatomic, assign, readonly) BSTimerViewState state;
@property (nonatomic, assign, readonly) BSTimerViewType type;

@property (nonatomic, assign) BOOL counting;  // 是否正在计时


- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTimeInterval:(NSInteger)count NS_DESIGNATED_INITIALIZER;

- (void)start;

- (void)invalidate;


#pragma mark - state

- (void)setTitle:(NSString *)title forState:(BSTimerViewState)state;
- (void)setTitleColor:(UIColor *)color forState:(BSTimerViewState)state;
- (void)setBackgroundColor:(UIColor *)color forState:(BSTimerViewState)state;

- (NSString *)titleForState:(BSTimerViewState)state;
- (UIColor *)titleColorForState:(BSTimerViewState)state;
- (UIColor *)backgroundColorForState:(BSTimerViewState)state;

@end


@protocol BSYTimerViewDelegate <NSObject>

@optional

- (void)timerViewDidEnd:(BSYTimerView *)view;
- (void)timerViewDidStart:(BSYTimerView *)view;

@end

NS_ASSUME_NONNULL_END
