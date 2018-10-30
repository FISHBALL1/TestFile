//
//  UIView+Expand.h
//  NewLive
//
//  Created by niuy on 17/2/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

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

