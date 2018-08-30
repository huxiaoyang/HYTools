//
//  UIView+BSKit.m
//  HYTools
//
//  Created by void on 2018/8/30.
//  Copyright © 2018年 void. All rights reserved.
//

#import "UIView+BSKit.h"
#import <objc/runtime.h>


static const char KEY_UIVIEW_BSKit_HIT_EDGE_INSETS;


@implementation UIView (BSKit)

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_UIVIEW_BSKit_HIT_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_UIVIEW_BSKit_HIT_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(!self.userInteractionEnabled || self.hidden) {
        return NO;
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
