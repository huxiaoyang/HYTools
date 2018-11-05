//
//  BSAdaptationUtils.h
//  BSKit
//
//  Created by ucredit-XiaoYang on 16/5/12.
//  Copyright © 2016年 Xiao Yang. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/// Get main screen's size. Height is always larger than width.
CGSize BSScreenSize(void);


static inline CGFloat BSFloat(CGFloat value) {
    CGSize size = BSScreenSize();
    return value/375.0 * size.width;
}


static inline CGSize BSSize(CGSize size) {
    CGFloat width = BSFloat(size.width);
    CGFloat height = BSFloat(size.height);
    return CGSizeMake(width, height);
}


static inline CGFloat BSSafeBottomFloat(CGFloat value) {
    
    if (@available(iOS 11.0, *)) {
        if (!UIEdgeInsetsEqualToEdgeInsets(UIApplication.sharedApplication.windows[0].safeAreaInsets, UIEdgeInsetsZero)) {
            return (BSFloat(value) + 34);
        }
        return BSFloat(value);
    }
    
    return BSFloat(value);
}

static inline CGFloat BSSafeTopFloat(CGFloat value) {
    
    if (@available(iOS 11.0, *)) {
        if (!UIEdgeInsetsEqualToEdgeInsets(UIApplication.sharedApplication.windows[0].safeAreaInsets, UIEdgeInsetsZero)) {
            return (BSFloat(value) + 24);
        }
        return BSFloat(value);
    }
    
    return BSFloat(value);
}


// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize BSScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth BSScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight BSScreenSize().height
#endif

#ifndef kSafeAreaInsetsTop
#define kSafeAreaInsetsTop BSSafeTopFloat(0)
#endif

#ifndef kSafeAreaInsetsBottom
#define kSafeAreaInsetsBottom BSSafeBottomFloat(0)
#endif


/**
 - 判断当前系统版本是否高于设定版本
 - 适用于做系统版本适配
 - 比如使用iOS8.3.1之后的API：if(BiggerVersion((NSOperatingSystemVersion){8,3,1})){// iOS8.3.1之后的API}
 
 @param v 设定iOS版本 - 例：
 @return true/false
 */
static inline BOOL BSAboveVersion(NSOperatingSystemVersion v) {
    return [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:v];
}


NS_ASSUME_NONNULL_END

