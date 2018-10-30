//
//  selectSexViewController.m
//  test
//
//  Created by niuy on 16/11/18.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "selectSexViewController.h"
#import "MineViewController.h"

//#import "MineButton.h"
@interface selectSexViewController ()
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *buttonMan;
@property (nonatomic, strong) UIButton *buttonWomen;

@end

@implementation selectSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:SMWhiteColor];//[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]
    //隐藏系统自带导航栏
    [self.navigationController setNavigationBarHidden:YES];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 33,ScreenWidth,18)];
    self.labelTitle.font = SMSystemBoldFont(17);
    self.labelTitle.text = NSLocalizedString(@"性别", nil);
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    //导航栏返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(0, 20, 35, 44);
    [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 7.5, 0, 0)];
    [self.backButton addTarget:self action:@selector(popFromCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:self.backButton];
    [topView addSubview:self.labelTitle];
    [self.view addSubview:topView];
    
    UIScrollView *backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight)];
    backScrollView.alwaysBounceVertical = YES;
    backScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:backScrollView];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 2 * ScreenHeight)];
    [view setBackgroundColor:[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]];
    [backScrollView addSubview:view];
    
    
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0,10, ScreenWidth, 67 * 2 + 2 / mainScale)];
    [backView1 setBackgroundColor:SMWhiteColor];
    [backScrollView addSubview:backView1];
    
    CGFloat buttonHeight = 67;

    //UIButton *buttonMan = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth, buttonHeight)];
    _buttonMan = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth, buttonHeight)];
    _buttonMan.tag = 1;
    [_buttonMan addTarget:self action:@selector(man) forControlEvents:UIControlEventTouchUpInside];
    [_buttonMan setTitle:@"男" forState:UIControlStateNormal];
    [_buttonMan.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_buttonMan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //buttonMan.backgroundColor = [UIColor redColor];
    //调整button的文字的具体位置（下面两个属性需要同时使用）
    [_buttonMan setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
    _buttonMan.contentEdgeInsets = UIEdgeInsetsMake(0,20,0,0);// 上左下右
    [backScrollView addSubview:_buttonMan];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 77, ScreenWidth, 1)];
    //lineView.backgroundColor = [UIColor blackColor];
    [lineView setBackgroundColor:[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1]];
    [backScrollView addSubview:lineView];
    
    _buttonWomen = [[UIButton alloc] initWithFrame:CGRectMake(0,78, ScreenWidth, buttonHeight)];
    _buttonWomen.tag = 2;
    [_buttonWomen addTarget:self action:@selector(women) forControlEvents:UIControlEventTouchUpInside];
    [_buttonWomen setTitle:@"女" forState:UIControlStateNormal];
    [_buttonWomen.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_buttonWomen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //buttonWomen.backgroundColor = [UIColor redColor];
    [_buttonWomen setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
    _buttonWomen.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [backScrollView addSubview:_buttonWomen];
    
}

- (void)man{
    
    if ([self.delegate respondsToSelector:@selector(selectMan:)])  {
        [self.delegate selectMan:_buttonMan.titleLabel.text];
    }
    [self.navigationController popViewControllerAnimated:true];
    
}
- (void)women{
    
    if ([self.delegate respondsToSelector:@selector(selectMan:)]) {
        [self.delegate selectMan:_buttonWomen.titleLabel.text];
    }
    [self.navigationController popViewControllerAnimated:true];

    
}
- (void)popFromCurrentViewController
{
    [[LoadingAnimation shareInstance] dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
