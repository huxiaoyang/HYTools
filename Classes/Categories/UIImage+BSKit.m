//
//  UIImage+BSKit.m
//  StarterKit
//
//  Created by XiaoYang on 15/10/8.
//  Copyright © 2015年 XiaoYang. All rights reserved.
//

#import "UIImage+BSKit.h"


@implementation UIImage (BSKit)

- (UIImage *)bs_imageByApplyingAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (UIImage *)bs_imageWithColor:(UIColor *)color {
    return [self bs_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)bs_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)bs_imageNamed:(NSString *)name {
    if (name.length == 0 || [name hasSuffix:@"/"]) return nil;
        
    CGFloat screenScale = [UIScreen mainScreen].scale;
    NSString *imageScale = nil;
    if (screenScale <= 1) {
        imageScale = @"";
    }else if (screenScale <= 2) {
        imageScale = @"@2x";
    } else {
        imageScale = @"@3x";
    }
    NSString *imageNamed = [NSString stringWithFormat:@"%@%@", name, imageScale];
    NSArray *exts = @[@"", @"png", @"jpeg", @"jpg", @"gif", @"webp", @"apng"];
    NSString *path = nil;
    for (NSString *e in exts) {
        path = [[NSBundle mainBundle] pathForResource:imageNamed ofType:e];
        if (path) break;
    }
    if (path.length == 0) return [UIImage imageNamed:name];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data.length == 0) return [UIImage imageNamed:name];
    
    return [[UIImage alloc] initWithData:data scale:screenScale];
    
}

@end
