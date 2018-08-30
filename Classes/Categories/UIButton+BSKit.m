//
//  UIButton+BSKit.m
//  StarterKit
//
//  Created by XiaoYang on 15/10/13.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import "UIButton+BSKit.h"

@implementation UIButton (BSKit)

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
