//
//  UIResponder+Keypath.m
//  HYTools
//
//  Created by void on 2018/8/29.
//  Copyright © 2018年 void. All rights reserved.
//

#import "UIResponder+Xpath.h"


@implementation UIResponder (Xpath)

- (NSString *)bs_xpath {
    return [self bs_xpathWithNodeClassName:NSStringFromClass(UIApplication.class)];
}

- (NSString *)bs_xpathWithNodeClassName:(NSString *)className {
    
    NSString *placeholderIndex = @"#";
    NSString *subscript = [NSString stringWithFormat:@"[%@]", placeholderIndex];
    
    NSString *path = [NSString stringWithFormat:@"%@%@", self.class, subscript];
    NSLog(@"path --- > %@", path);
    
    UIResponder *responder = (UIResponder *)self;
    UIResponder *subResponder = (UIResponder *)self;
    
    while (responder.nextResponder) {
        
        /// 用来计算下标的响应层 - 当前响应层的上一层
        subResponder = responder;
        /// 当前的响应层
        responder = responder.nextResponder;
        
        NSString *responderName = NSStringFromClass(responder.class);
        if ([responderName hasPrefix:@"UI"]) {
            if ([responderName containsString:@"ContainerView"] ||
                [responderName containsString:@"TransitionView"] ||
                [responderName containsString:@"WrapperView"]) {
                continue;
            }
        }
        
        if ([responder isKindOfClass:UIViewController.class]) {
            
            if ([subResponder isKindOfClass:UIView.class]) {
                
                path = [path stringByReplacingOccurrencesOfString:subscript
                                                       withString:@""];
                
            }
            else if ([subResponder isKindOfClass:UIViewController.class]) {
                
                NSUInteger index = [((UIViewController *)responder).childViewControllers indexOfObject:(UIViewController *)subResponder];
                path = [path stringByReplacingOccurrencesOfString:placeholderIndex
                                                       withString:@(index).stringValue];
                
            }
            
        }
        else if ([responder isKindOfClass:UITableView.class] &&
                 [subResponder isKindOfClass:UITableViewCell.class]) {
            
            NSIndexPath *indexPath = [(UITableView *)responder indexPathForCell:(UITableViewCell *)subResponder];
            NSString *info = [NSString stringWithFormat:@"indexPath:{%ld, %ld}", (long)indexPath.section, (long)indexPath.row];
            path = [path stringByReplacingOccurrencesOfString:placeholderIndex
                                                   withString:info];
            
        }
        else if ([responder isKindOfClass:UICollectionView.class] &&
                 [subResponder isKindOfClass:UICollectionViewCell.class]) {
            
            NSIndexPath *indexPath = [(UICollectionView *)responder indexPathForCell:(UICollectionViewCell *)subResponder];
            NSString *info = [NSString stringWithFormat:@"indexPath:{%ld, %ld}", (long)indexPath.section, (long)indexPath.row];
            path = [path stringByReplacingOccurrencesOfString:placeholderIndex
                                                   withString:info];
            
        }
        else if ([responder isKindOfClass:UIView.class]) {
            
            if ([subResponder isKindOfClass:UIViewController.class]) {
                
                path = [path stringByReplacingOccurrencesOfString:subscript
                                                       withString:@""];
                
            }
            else if ([subResponder isKindOfClass:UIView.class]) {
                
                NSMutableArray *memberSubviews = [NSMutableArray array];
                for (UIView *subView in ((UIView *)responder).subviews) {
                    if ([subView isMemberOfClass:subResponder.class]) {
                        [memberSubviews addObject:subView];
                    }
                }
                
                NSUInteger index = [memberSubviews indexOfObject:(UIView *)subResponder];
                NSString *info = [NSString stringWithFormat:@"index:%ld-frame:%@", (long)index, NSStringFromCGRect(((UIView *)subResponder).frame)];
                path = [path stringByReplacingOccurrencesOfString:placeholderIndex
                                                       withString:info];
                
            }
            
        }
        else if ([responder isKindOfClass:UIApplication.class] &&
                 [subResponder isKindOfClass:UIWindow.class]) {
            
            NSUInteger index = [((UIApplication *)responder).windows indexOfObject:(UIWindow *)subResponder];
            path = [path stringByReplacingOccurrencesOfString:placeholderIndex
                                                   withString:@(index).stringValue];
            
        }
        
        if ([responder isMemberOfClass:NSClassFromString(className)]) {
            path = [NSString stringWithFormat:@"%@/%@", responder.class, path];
            NSLog(@"path --- > %@", path);
            break;
        }
        
        path = [NSString stringWithFormat:@"%@%@/%@", responder.class, subscript, path];
        NSLog(@"path --- > %@", path);
    }
    
    return path;
}



@end
