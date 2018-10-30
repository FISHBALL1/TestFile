//
//  modifyNickViewController.m
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "modifyNickViewController.h"
#import "UIView+Expand.h"
#import "MineViewController.h"
@interface modifyNickViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) UITextField *contactTextField;
@property (nonatomic, strong) UIButton *feedbackBtn;
@property (nonatomic, strong) UIButton *themewishBtn;
@property (nonatomic, strong) UIView *conetntView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, strong) NSString *contact;

@end

@implementation modifyNickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"修改昵称", nil);
    self.view.backgroundColor = SMHexColor(0xf6f6f6);
    
    self.keyboardHeight = 258.0;//因为注册通知获取键盘高度发现有时高度不准确所以取键盘可能的最大值为键盘高度
    
    [self.customNavBarView addSubview:self.sendBtn];
    
    self.conetntView = [[UIView alloc] initWithFrame:CGRectMake(0, [self getStartOriginY], ScreenWidth, [self getContentViewHeight])];
    [self.view addSubview:self.conetntView];
    [self.conetntView addSubview:self.feedbackBtn];
    self.feedbackBtn.center = CGPointMake(self.feedbackBtn.center.x, 25);
    self.feedbackBtn.selected = YES;
    [self.conetntView addSubview:self.themewishBtn];
    self.themewishBtn.center = CGPointMake(self.themewishBtn.center.x, 25);
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3, 10)];
    lineImage.image = [UIImage imageNamed:@"tabLine"];
    lineImage.center = CGPointMake(ScreenWidth/2.0, 25);
    [self.conetntView addSubview:lineImage];
    
    UIView *contactView = [[UIView alloc] initWithFrame:CGRectMake(0, 25, ScreenWidth, 44)];
    contactView.backgroundColor = SMWhiteColor;
    [contactView addSubview:self.contactTextField];
    [self.conetntView addSubview:contactView];
    
    [self.view bringSubviewToFront:self.customNavBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[LoadingAnimation shareInstance] dismiss];
}

- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = NSLocalizedString(@"保存", nil);
        [_sendBtn setTitle:title forState:UIControlStateNormal];
        [_sendBtn setTitleColor:SMHexColor(0x009cff) forState:UIControlStateNormal];
        UIFont *font = [UIFont boldSystemFontOfSize:15];
        _sendBtn.titleLabel.font = font;
        CGFloat width = [title sizeWithAttributes:@{NSFontAttributeName:font}].width;
        _sendBtn.frame = CGRectMake(ScreenWidth-20-width, 20, width, 44);
        [_sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

- (UITextField *)contactTextField{
    if (!_contactTextField) {
        _contactTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 44)];
        _contactTextField.placeholder = NSLocalizedString(@"填写你的QQ/手机/邮箱", nil);
        _contactTextField.backgroundColor = SMWhiteColor;
        _contactTextField.font = [UIFont systemFontOfSize:15];
        _contactTextField.textColor = SMHexColor(0x272b3c);
        _contactTextField.returnKeyType = UIReturnKeySend;
        _contactTextField.delegate = self;
    }
    return _contactTextField;
    
}

- (void)send{
    [self.view endEditing:YES];
    //contact = self.contactTextField.text;
    //mine.contact记录用户在textfiled输入的值
    _contact = self.contactTextField.text;
    
    if (_contact.length == 0){
        [[LoadingAnimation shareInstance]dismissWithError:NSLocalizedString(@"请输入QQ/手机号/邮箱信息", nil)];
        return;
    }
    //_contact = [_contact stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //3.把当前对象的委托设置为要跳转的TowViewController对象
//    MineViewController *mine = [[MineViewController alloc] init];
//    self.delegate = mine;
    //4.掉用代理方法
    if ([self.delegate respondsToSelector:@selector(nickText:)]) {
        [self.delegate nickText:_contact];
    }
    
    //跳转到显示页面
  
//    [self.navigationController popViewController:mine animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
   // NSLog(mine.contact);
    
    }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -- UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.keyboardHeight>ScreenHeight-327) {
        [UIView animateWithDuration:0.25 animations:^{
            self.conetntView.top = [self getStartOriginY]-(self.keyboardHeight-(ScreenHeight-327));
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.25 animations:^{
        self.conetntView.top = [self getStartOriginY];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self send];
    return YES;
}

@end
