//
//  BlockViewController.h
//  test
//
//  Created by niuy on 17/10/16.
//  Copyright © 2017年 niuy. All rights reserved.
//


                                    //使用Block属性实现回调传值（从后往前传）

#import <UIKit/UIKit.h>
typedef void(^returnTextBlock)(NSString *text);

@interface BlockViewController : UIViewController

//第一步在我们的传值的页面声明一个Block属性
@property (nonatomic, copy) returnTextBlock returnTextBlock;

//- (void)returnText:(returnTextBlock)textBlock;

@end
