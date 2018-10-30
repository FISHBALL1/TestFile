//
//  UserProtocolWebViewController.m
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//
#define BASERURL @"http://as.sjjiasu.com/"
#import "UserProtocolWebViewController.h"

@interface UserProtocolWebViewController ()

@property (nonatomic,strong) UIWebView *userProtoclWebView;

@end

@implementation UserProtocolWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    [nav setBackgroundColor:SMHexColor(0xF6F6F6)];
    [self.view addSubview:nav];
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 22, 40, 40)];
    UIImage *image = [UIImage imageNamed:self.isFromLogin ? @"blackClose" : @"back"];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(closeViewContorller) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:leftButton];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 30, ScreenWidth - 140, 20)];
    titleLabel.font = SMSystemBoldFont(17.f);
    titleLabel.text= NSLocalizedString(@"用户协议", nil);
    [nav addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    CGRect frame = self.view.bounds;
    frame.origin.y += 64;
    frame.size.height-= 64;
    self.userProtoclWebView = [[UIWebView alloc]initWithFrame:frame];
    //NSURL *url = [NSURL URLWithString:[BASERURL stringByAppendingString:@"agreement.html"]];
     NSURL *url = [NSURL URLWithString:@"https://as.sjjiasu.com/agreement.html"];
    [self.userProtoclWebView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:self.userProtoclWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeViewContorller{
    if (self.isFromLogin) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

