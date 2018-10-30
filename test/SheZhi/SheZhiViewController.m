//
//  SheZhiViewController.m
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//
//#define YYSDLJ @"https://www.baidu.com"
#import "SheZhiViewController.h"
#import "MineButton.h"
#import "LoadingAnimation.h"
#import "UserProtocolWebViewController.h"
#import "FeedBackViewController.h"
@interface SheZhiViewController ()<UIActionSheetDelegate>{
    UILabel *sizeLabel;
}

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *labelTitle ;
@property (nonatomic, strong) void(^loginOut)(BOOL success);
@end

@implementation SheZhiViewController
-(void)setLoginOut:(void (^)(BOOL success))loginOut{
    _loginOut = loginOut;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:SMWhiteColor];//[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]
    [self.navigationController setNavigationBarHidden:YES];
    
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    //顶部个人中心tab bar
    //[topView setBackgroundColor:[UIColor whiteColor]];
    [topView setBackgroundColor:[UIColor blueColor]];
    self.labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 33, ScreenWidth, 18)];
    self.labelTitle.font = SMSystemBoldFont(17);
    self.labelTitle.text = NSLocalizedString(@"设置", nil);
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.labelTitle];
    [self.view addSubview:topView];
    
    UIScrollView *backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-113)];
    backScrollView.alwaysBounceVertical = YES;
    backScrollView.showsVerticalScrollIndicator = NO;
    //backScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:backScrollView];
    
    //底层view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 2 * ScreenHeight)];
    [view setBackgroundColor:[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]];
    //[view setBackgroundColor:[UIColor blackColor]];
    [backScrollView addSubview:view];
    //CGFloat viewMaxY = 0;
    //CGFloat viewHeight = 236;
    //头部图像处view
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 336)];
    [headView setBackgroundColor:[UIColor whiteColor]];
    //[headView setBackgroundColor:[UIColor redColor]];
    UITapGestureRecognizer *tapLogin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userLogin)];
    [headView addGestureRecognizer:tapLogin];
    /*
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-100, 15, 60, 60)];
    self.headImageView.backgroundColor = [UIColor lightGrayColor];
    self.headImageView.image = [UIImage imageNamed:@"defaultHead"];
    self.headImageView.layer.cornerRadius = 40;
    self.headImageView.clipsToBounds = YES;
     */
    CGFloat viewMaxY = 10;
    CGFloat viewHeight = 67;
    //1
    //MineButton *button = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    MineButton *button = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button.tag = 0;
    [button addTarget:self action:@selector(feedBack) forControlEvents:UIControlEventTouchUpInside];
    [button setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"意见反馈", nil)];
    button.backgroundColor = [UIColor greenColor];
    [headView addSubview:button];
    
    viewMaxY += viewHeight+1; //78
    viewHeight = 1/mainScale;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView];
    
    //2
    viewMaxY += viewHeight; //78+1/2
    viewHeight = 67;
    //3
    MineButton *button1 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button1.tag = 5;
    [button1 addTarget:self action:@selector(UserAgreement) forControlEvents:UIControlEventTouchUpInside];
    [button1 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"用户协议", nil)];
    button1.backgroundColor = [UIColor greenColor];
    [headView addSubview:button1];
    
    viewMaxY += viewHeight+1; //78+1/2+67+1
    viewHeight = 1/mainScale;
    //4
    UIView *lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView3 setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView3];
    //
    viewMaxY += viewHeight;  //78+1/2+67+1/2
    viewHeight = 67;
    MineButton *button2 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button2.tag = 6;
    [button2 addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"给e起玩评分", nil)];
    button2.backgroundColor = [UIColor greenColor];
    [headView addSubview:button2];
    //
    viewMaxY += viewHeight+1; //78+1/2+67+67+1
    viewHeight = 1/mainScale;
    //
    UIView *lineView4 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView4 setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView4];
    //
    viewMaxY += viewHeight;  //78+1/2+67+1/2
    viewHeight = 67;
    MineButton *button3 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button3.tag = 7;
    [button3 addTarget:self action:@selector(cleanCache) forControlEvents:UIControlEventTouchUpInside];
    [button3 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"清理缓存", nil)];
    //button3.backgroundColor = [UIColor greenColor];
    [headView addSubview:button3];
    
    [headView addSubview:self.headImageView];
    [backScrollView addSubview:headView];
    
    viewMaxY += (viewHeight+10);
    viewHeight = 67;
    
    //
    UIButton *qutButton = [[UIButton alloc] initWithFrame:CGRectMake(0,viewMaxY,ScreenWidth, viewHeight)];
    qutButton.tag = 5;
    [qutButton addTarget:self action:@selector(quit:) forControlEvents:UIControlEventTouchUpInside];
    [qutButton setTitle:@"退出登录" forState:UIControlStateNormal];//设置button的title
    qutButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [qutButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    qutButton.backgroundColor = [UIColor greenColor];
    [backScrollView addSubview:qutButton];

    viewMaxY += (viewHeight);
    viewHeight = 67;
    
    [backScrollView setContentSize:CGSizeMake(0, viewMaxY)];
    backScrollView.bounces = YES;
}
/*
 -(void)viewWillAppear:(BOOL)animated{
 if ([[ASUserModel instance] isLogin]) {
 NSString *avatar = [ASUserModel instance].avatarUrl;
 [self.headImageView sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:@"defaultHead"] options:SDWebImageRetryFailed];
 self.labelTitle.text = ([[ASUserModel instance].userNickName isEqualToString:@""] || [ASUserModel instance].userNickName == nil) ? [ASUserModel instance].userName : [ASUserModel instance].userNickName;
 }
 }
 */
//退出登录
- (void)quit:(UIButton *)sender{
    //[[ASUserModel instance]isLogin]
    if (1) {
        UIActionSheet *alert = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"退出后不会删除历史数据，下次使用本账号登录将重新载入数据。", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"取消", nil) destructiveButtonTitle:NSLocalizedString(@"退出登录", nil) otherButtonTitles:nil];
        [alert showInView:self.view];
    }else{
        [[LoadingAnimation shareInstance] dismissWithError:NSLocalizedString(@"您还没有登录", nil)];
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //[[ASUserModel instance]reset];
        [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"成功退出登录", nil)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if(self.loginOut){
                //self.loginOut(![ASUserModel instance].isLogin);
            }
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

//清理缓存
-(void)cleanCache{
    CGFloat nowCahce = [[SDImageCache sharedImageCache] getSize];
    if (nowCahce <= 0.00001) {
        [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"没有缓存", nil)];
        return;
    }
    [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"正在清理", nil)];
    [[SDImageCache sharedImageCache] clearDisk];
    nowCahce = [[SDImageCache sharedImageCache] getSize];
    if (nowCahce <= 0.00001) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            sizeLabel.text = [NSString stringWithFormat:@"%.2f MB",((nowCahce/1024.0)/1024.0)];
            [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"清理成功", nil)];
        });
    }
    
}

//给e起玩评分
-(void)buttonDidClick:(UIButton *)sender{
            NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
            [[UIApplication sharedApplication] openURL:url];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//用户协议
-(void)UserAgreement{

    UserProtocolWebViewController *userProtocol = [[UserProtocolWebViewController alloc] init];
    userProtocol.isFromLogin = NO;
    [self.navigationController pushViewController:userProtocol animated:YES];
    
}

//反馈
-(void) feedBack{

    FeedBackViewController *feedback = [[FeedBackViewController alloc] init];
    [self.navigationController pushViewController:feedback animated:YES];

}
/*
 -(void)buttonDidClick:(UIButton *)sender{
 switch (sender.tag) {
 case 1:
 {
 if ([[ASUserModel instance] isLogin]) {
 MyCollectionViewController *myCollectionViewController = [[MyCollectionViewController alloc] init];
 [self.navigationController pushViewController:myCollectionViewController animated:YES];
 }else{
 LoginViewController *LoginVc = [[LoginViewController alloc]init];
 [self presentViewController:LoginVc animated:YES completion:nil];
 }
 }
 break;
 case 2:
 {
 }
 break;
 case 3:
 {
 FeedBackViewController *feedBackViewController = [[FeedBackViewController alloc] init];
 [self.navigationController pushViewController:feedBackViewController animated:YES];
 }
 break;
 case 4:
 {
 }
 break;
 case 5:
 {
 MoreViewController *moreViewController = [[MoreViewController alloc] init];
 s_weak_self;
 [moreViewController setLoginOut:^(BOOL success) {
 if (success) {
 [weakSelf loginOut];
 }
 }];
 [self.navigationController pushViewController:moreViewController animated:YES];
 }
 break;
 
 default:
 break;
 }
 }
 
 - (void)userLogin {
 if (![[ASUserModel instance] isLogin]) {
 LoginViewController *LoginVc = [[LoginViewController alloc]init];
 LoginVc.trackParentPosition = self.trackPosition;
 LoginVc.trackPosition = PositionGroup(self.trackPosition, Position_Mine_Login);
 s_weak_self;
 [LoginVc setLoginCompletion:^(BOOL success) {
 if (success) {
 [weakSelf showUserInfo];
 }
 }];
 [self presentViewController:LoginVc animated:YES completion:^{
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
 }];
 }
 }
 
 -(void)showUserInfo{
 NSString *avatar = [ASUserModel instance].avatarUrl;
 [self.headImageView sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:@"defaultHead"] options:SDWebImageRetryFailed];
 
 self.labelTitle.text = ([[ASUserModel instance].userNickName isEqualToString:@""] || [ASUserModel instance].userNickName == nil) ? [ASUserModel instance].userNickName : [ASUserModel instance].userName;
 }
 -(void)loginOut{
 self.headImageView.image = [UIImage imageNamed:@"defaultHead"];
 self.labelTitle.text = NSLocalizedString(@"请登录", nil);
 }
 */
@end
