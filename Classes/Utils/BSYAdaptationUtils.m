//
//  BSAdaptationUtils.m
//  BSKit
//
//  Created by ucredit-XiaoYang on 16/5/12.
//  Copyright © 2016年 Xiao Yang. All rights reserved.
//
//  布局适配

#import "BSYAdaptationUtils.h"


CGSize BSScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}



