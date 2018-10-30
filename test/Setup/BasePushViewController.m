//
//  BasePushViewController.m
//  SuperM
//
//  Created by xuanpf on 16/8/2.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "BasePushViewController.h"

@interface BasePushViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation BasePushViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //公用的头部nav bar
    self.customNavBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    self.customNavBarView.backgroundColor = SMHexColor(0xf6f6f6);
    [self.view addSubview:self.customNavBarView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 20, ScreenWidth-150, 44)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    self.titleLabel.textColor = SMHexColor(0x272b3c);
    [self.customNavBarView addSubview:self.titleLabel];
    
    //公用的返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(0, 20, 35, 44);
    [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 7.5, 0, 0)];
    [self.backButton addTarget:self action:@selector(popFromCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.customNavBarView addSubview:self.backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)getStartOriginY
{    
    return 64.f; // navigationBar ＋ statusBar
}

- (float)getContentViewHeight
{
    return ScreenHeight - 64.f;
}

- (void)popFromCurrentViewController
{
    
    [self.navigationController popViewControllerAnimated:YES];//回退到上一个页面；
}

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

@end
