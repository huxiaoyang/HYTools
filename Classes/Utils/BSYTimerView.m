//
//  BSTimerView.m
//  void_tools
//
//  Created by ucredit-XiaoYang on 2017/9/15.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

#import "BSYTimerView.h"
#import "BSYTimer.h"


NSString *NSStringFromBSTimerViewState(BSTimerViewState state) {
    switch (state) {
        case BSTimerViewStateNormal:
            return @"BSTimerViewStateNormal";
        case BSTimerViewStateCounting:
            return @"BSTimerViewStateCounting";
        case BSTimerViewStateDisabled:
            return @"BSTimerViewStateDisabled";
    }
}

static NSString * const PLACEHOLDER = @"#";


@interface BSYTimerView ()

@property (nonatomic, strong) NSMutableDictionary *titleBuilder;
@property (nonatomic, strong) NSMutableDictionary *backgroundColorBilder;
@property (nonatomic, strong) NSMutableDictionary *titleColorBuilder;

@property (nonatomic, strong) NSDate *countUntil;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) BSYTimer *timer;

@end


@implementation BSYTimerView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithTimeInterval:60];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self initWithTimeInterval:60];
}

- (instancetype)initWithTimeInterval:(NSInteger)count {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _count = count;
        [self initializeDefault];
    }
    return self;
}

- (void)initializeDefault {
    _counting = NO;
    _type = BSTimerViewTypeBackward;
    
    [self pr_setDefaultBuilder];
    [self pr_setupViews];
}

- (void)layoutSubviews {
    _titleLabel.frame = self.bounds;
}

#pragma mark - public method

- (void)start {
    if (_counting) return;
    _counting = YES;
    [self pr_setLabelWithState:BSTimerViewStateCounting];
    self.countUntil = [NSDate dateWithTimeIntervalSinceNow:self.count];
    [self pr_setTimer];
}

- (void)invalidate {
    _counting = NO;
    [_timer invalidate];
    _timer = nil;
    [self pr_setLabelWithState:BSTimerViewStateNormal];
    NSString *title = [self titleForState:BSTimerViewStateNormal];
    [self pr_replacingTitle:title withString:[@(_count) stringValue]];
}


#pragma mark - state

- (NSString *)titleForState:(BSTimerViewState)state {
    if (![[_titleBuilder allKeys] containsObject:NSStringFromBSTimerViewState(state)]) {
        return _titleBuilder[NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
    }
    return _titleBuilder[NSStringFromBSTimerViewState(state)];
}

- (UIColor *)titleColorForState:(BSTimerViewState)state {
    if (![[_titleColorBuilder allKeys] containsObject:NSStringFromBSTimerViewState(state)]) {
        return _titleColorBuilder[NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
    }
    return _titleColorBuilder[NSStringFromBSTimerViewState(state)];
}

- (UIColor *)backgroundColorForState:(BSTimerViewState)state {
    if (![[_backgroundColorBilder allKeys] containsObject:NSStringFromBSTimerViewState(state)]) {
        return _backgroundColorBilder[NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
    }
    return _backgroundColorBilder[NSStringFromBSTimerViewState(state)];
}


- (void)setTitle:(NSString *)title forState:(BSTimerViewState)state {
    [self pr_setTitle:title forState:state];
}

- (void)setTitleColor:(UIColor *)color forState:(BSTimerViewState)state {
    [self pr_setTitleColor:color forState:state];
}

- (void)setBackgroundColor:(UIColor *)color forState:(BSTimerViewState)state {
    [self pr_setBackgroundColor:color forState:state];
}

#pragma mark - private method

- (void)pr_setupViews {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel adjustsFontSizeToFitWidth];
    [self addSubview:_titleLabel];
    [self pr_setLabelWithState:BSTimerViewStateNormal];
}

- (void)pr_setDefaultBuilder {
    _titleBuilder = [NSMutableDictionary dictionary];
    _titleColorBuilder = [NSMutableDictionary dictionary];
    _backgroundColorBilder = [NSMutableDictionary dictionary];
    [_titleBuilder setValue:[@(_count) stringValue]
                     forKey:NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
    [_titleColorBuilder setValue:[UIColor darkTextColor]
                          forKey:NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
    [_backgroundColorBilder setValue:[UIColor whiteColor]
                              forKey:NSStringFromBSTimerViewState(BSTimerViewStateNormal)];
}

- (void)pr_setTitle:(NSString *)title forState:(BSTimerViewState)state {
    [_titleBuilder setValue:title forKey:NSStringFromBSTimerViewState(state)];
    if (state == BSTimerViewStateNormal) {
        _titleLabel.text = title;
    }
}

- (void)pr_setTitleColor:(UIColor *)color forState:(BSTimerViewState)state {
    [_titleColorBuilder setValue:color forKey:NSStringFromBSTimerViewState(state)];
    if (state == BSTimerViewStateNormal) {
        _titleLabel.textColor = color;
    }
}

- (void)pr_setBackgroundColor:(UIColor *)color forState:(BSTimerViewState)state {
    [_backgroundColorBilder setValue:color forKey:NSStringFromBSTimerViewState(state)];
    if (state == BSTimerViewStateNormal) {
        _titleLabel.backgroundColor = color;
    }
}

- (void)pr_setTitle:(NSString *)title {
    
    NSInteger currentCount = ceil([_countUntil timeIntervalSinceDate:[NSDate date]]);
    
    if (_type == BSTimerViewTypeForward) {
        currentCount = (_count - currentCount);
    }
    
    if (_type == BSTimerViewTypeBackward && currentCount > 0) {
        [self pr_replacingTitle:title withString:[@(currentCount) stringValue]];
        return;
    }
    
    if (_type == BSTimerViewTypeForward && currentCount < _count) {
        [self pr_replacingTitle:title withString:[@(currentCount) stringValue]];
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(timerViewDidEnd:)]) {
        [self.delegate timerViewDidEnd:self];
    }
    
    [self invalidate];
}

- (void)pr_replacingTitle:(NSString *)title withString:(NSString *)string {
    if ([title rangeOfString:PLACEHOLDER].location == NSNotFound) {
        _titleLabel.text = title;
    } else {
        _titleLabel.text = [title stringByReplacingOccurrencesOfString:PLACEHOLDER
                                                            withString:string];
    }
}

- (void)pr_setTitleWithState:(BSTimerViewState)state {
    NSString *title = [self titleForState:state];
    [self pr_setTitle:title];
}

- (void)pr_setLabelWithState:(BSTimerViewState)state {
    _titleLabel.textColor = [self titleColorForState:state];
    _titleLabel.backgroundColor = [self backgroundColorForState:state];
    self.backgroundColor = [self backgroundColorForState:state];
}



#pragma mark - timer

- (void)pr_setTimer {
    _timer = [BSYTimer timerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(pr_timerCounting:)
                                    repeats:YES];
    
    if ([self.delegate respondsToSelector:@selector(timerViewDidStart:)]) {
        [self.delegate timerViewDidStart:self];
    }

    [_timer fire];
}

- (void)pr_timerCounting:(BSYTimer *)timer {
    [self pr_setTitleWithState:BSTimerViewStateCounting];
}

@end

