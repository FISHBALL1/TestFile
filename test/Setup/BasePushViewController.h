//
//  BasePushViewController.h
//  SuperM
//
//  Created by xuanpf on 16/8/2.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "BaseViewController.h"

@interface BasePushViewController : BaseViewController

@property (nonatomic, strong) UIView *customNavBarView;
@property (nonatomic, strong) UIButton *backButton;

- (float)getStartOriginY;

- (float)getContentViewHeight;

- (void)popFromCurrentViewController;

@end
