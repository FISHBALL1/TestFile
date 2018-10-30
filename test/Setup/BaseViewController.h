//
//  BaseViewController.h
//  SuperM
//
//  Created by hanx on 16/7/21.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)translateViewController:(UIViewController *__nonnull)viewController view:(UIView *__nonnull)view completion:(void (^ __nullable)(void))completion;

- (void)popToLoginWithCompletion:(void (^ __nullable)(BOOL success))completion;

@end
