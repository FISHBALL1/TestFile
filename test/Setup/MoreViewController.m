//
//  MoreViewController.m
//  SuperM
//
//  Created by xuanpf on 16/8/1.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreButton.h"
#import "UserProtocolWebViewController.h"#
#import "UIView+Expand.h"

@interface MoreViewController ()<UIActionSheetDelegate>{
    UILabel *sizeLabel;
}

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) void(^loginOut)(BOOL success);

@end

@implementation MoreViewController

-(void)setLoginOut:(void (^)(BOOL success))loginOut{
    _loginOut = loginOut;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"设置", nil);
    self.view.backgroundColor = SMHexColor(0xf6f6f6);
   /*
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    self.iconImageView.image = [UIImage imageNamed:@"icon"];
    self.iconImageView.layer.cornerRadius = 18;
    [self.iconImageView setClipsToBounds:YES];
    self.iconImageView.center = CGPointMake(self.view.center.x, 15+40+[self getStartOriginY]);
    [self.view addSubview:self.iconImageView];
    */
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconImageView.bottom+12, ScreenWidth, 13)];
    self.titleLabel.textColor = SMHexColor(0x595d71);
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    //self.titleLabel.text = [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].displayName, [UIDevice currentDevice].clientShortVersion];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    
    MoreButton *agreementBtn = [MoreButton buttonWithType:UIButtonTypeCustom];
    agreementBtn.frame = CGRectMake(0, self.titleLabel.bottom+26, ScreenWidth, 44);
    agreementBtn.title = NSLocalizedString(@"用户协议", nil);
    agreementBtn.isNeedBottomLine = YES;
    agreementBtn.backgroundColor = SMWhiteColor;
    [agreementBtn addTarget:self action:@selector(gotoAgreement) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreementBtn];
    
    MoreButton *cleanBtn = [MoreButton buttonWithType:UIButtonTypeCustom];
    cleanBtn.frame = CGRectMake(0, agreementBtn.bottom, ScreenWidth, 44);
    cleanBtn.title = NSLocalizedString(@"清理缓存", nil);
    [cleanBtn addTarget:self action:@selector(cleanCache) forControlEvents:UIControlEventTouchUpInside];
    cleanBtn.backgroundColor = SMWhiteColor;
    cleanBtn.btnImageView.hidden = YES;
    [self.view addSubview:cleanBtn];
    sizeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15.5, 65, 13)];
    sizeLabel.font = SMSystemFont(12);
    sizeLabel.textColor = SMHexColor(0xFF4B4B);
    sizeLabel.textAlignment = NSTextAlignmentRight;
    //sizeLabel.text = [NSString stringWithFormat:@"%.2f MB",(([[SDImageCache sharedImageCache] getSize]/1024.0)/1024.0)];
    [cleanBtn addSubview:sizeLabel];
    
    MoreButton *shareBtn = [MoreButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, cleanBtn.bottom, ScreenWidth, 44);
    shareBtn.title = NSLocalizedString(@"分享给好友", nil);
    [shareBtn addTarget:self action:@selector(gotoShare) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.backgroundColor = SMWhiteColor;
    [self.view addSubview:shareBtn];
    shareBtn.hidden = YES;
    
    
    UIButton *quitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    quitBtn.frame = CGRectMake(0, cleanBtn.bottom+10, ScreenWidth, 44);
    [quitBtn setTitle:NSLocalizedString(@"退出登录", nil) forState:UIControlStateNormal];
    quitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIColor *buttonColor = SMHexColor(0xff4b4b);
    [quitBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    
    [quitBtn addTarget:self action:@selector(quit:) forControlEvents:UIControlEventTouchUpInside];
    quitBtn.backgroundColor = SMWhiteColor;
    [self.view addSubview:quitBtn];
    //quitBtn.hidden = ![[ASUserModel instance]isLogin];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)gotoAgreement{
    UserProtocolWebViewController *userProtocol = [[UserProtocolWebViewController alloc]init];
    userProtocol.isFromLogin = NO;
    [self.navigationController pushViewController:userProtocol animated:YES];
}

- (void)gotoShare{
    
}
/*
- (void)quit:(UIButton *)sender{
    if ([[ASUserModel instance]isLogin]) {
        UIActionSheet *alert = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"退出后不会删除历史数据，下次使用本账号登录将重新载入数据。", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"取消", nil) destructiveButtonTitle:NSLocalizedString(@"退出登录", nil) otherButtonTitles:nil];
        [alert showInView:self.view];
    }else{
        [[LoadingAnimation shareInstance] dismissWithError:NSLocalizedString(@"您还没有登录", nil)];
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [[ASUserModel instance]reset];
        [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"成功退出登录", nil)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if(self.loginOut){
                self.loginOut(![ASUserModel instance].isLogin);
            }
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}
*/
/*
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
*/
@end
