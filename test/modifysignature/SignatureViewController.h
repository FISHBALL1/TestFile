//
//  SignatureViewController.h
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePushViewController.h"
//声明代理方法
@protocol ViewControllerDelegate <NSObject>

- (void)changeText:(NSString *) currentview;

@end

@interface SignatureViewController : BasePushViewController
//声明代理变量
@property (nonatomic,weak)id <ViewControllerDelegate> delegate;
@end
