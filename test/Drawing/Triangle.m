//
//  Triangle.m
//  test
//
//  Created by niuy on 17/7/7.
//  Copyright © 2017年 niuy. All rights reserved.
//
/*
 基本绘图
 */

#import "Triangle.h"

@implementation Triangle

#pragma mark 绘图
//绘图只能在此方法中调用，否则无法得到当前图形上下文
- (void)drawRect:(CGRect)rect{
    //1.取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);//
}


@end
