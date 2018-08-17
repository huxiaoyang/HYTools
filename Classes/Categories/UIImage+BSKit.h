//
//  UIImage+BSKit.h
//  StarterKit
//
//  Created by XiaoYang on 15/10/8.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIImage (BSKit)


/**
 * Apply the alpha to the current image, return the new image
 *
 */
- (UIImage *)bs_imageByApplyingAlpha:(CGFloat)alpha;


/**
 *  生成纯色背景图片
 *
 *  @param color 颜色hex值
 *
 *  @return UIImage
 */
+ (UIImage *)bs_imageWithColor:(UIColor *)color;
+ (UIImage *)bs_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  使用imagewithcontentsoffile加载图片
 *  目的用于去缓存
 *
 *  @param name 图片名称
 *
 *  @return UIImage
 */
+ (UIImage *)bs_imageNamed:(NSString *)name;


@end

NS_ASSUME_NONNULL_END

