//
//  UIButton+BSKit.m
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import "UIButton+BSKit.h"
#import <objc/runtime.h>
#import <Foundation/Foundation.h>

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";


@implementation UIButton (BSKit)

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - ###### 处理UIButton在UIScrollView上时没有点击高亮状态 ####
#pragma mark - override
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [NSOperationQueue.mainQueue addOperationWithBlock:^{
        self.highlighted = YES;
    }];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self performSelector:@selector(pr_setDefault) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self performSelector:@selector(pr_setDefault) withObject:nil afterDelay:0.1];
}

- (void)pr_setDefault {
    self.highlighted = NO;
}


@end
