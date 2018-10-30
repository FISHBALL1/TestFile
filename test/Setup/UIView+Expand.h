//
//  UIView+Expand.h
//  SuperM
//
//  Created by xuanpf on 16/10/18.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Expand)

- (UIViewController *)firstAvailableUIViewController;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

- (void)cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)color;
- (void)removeAllSubviews;

@end
