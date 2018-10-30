//
//  SignatureViewController.m
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "SignatureViewController.h"
#import "UIView+Expand.h"
#import "MineViewController.h"
@interface SignatureViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) UITextField *signatureTextField;
@property (nonatomic, strong) UIButton *feedbackBtn;
//@property (nonatomic, strong) UIButton *themewishBtn;
@property (nonatomic, strong) UIView *conetntView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, strong) NSString *Signature;

@end

@implementation SignatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"修改签名", nil);
    self.view.backgroundColor = SMHexColor(0xf6f6f6);
    self.keyboardHeight = 258.0;//因为注册通知获取键盘高度发现有时高度不准确所以取键盘可能的最大值为键盘高度
    
    [self.customNavBarView addSubview:self.sendBtn];
    
    self.conetntView = [[UIView alloc] initWithFrame:CGRectMake(0, [self getStartOriginY], ScreenWidth, [self getContentViewHeight])];
    [self.view addSubview:self.conetntView];
    //self.conetntView.backgroundColor = [UIColor blackColor];
    [self.conetntView addSubview:self.feedbackBtn];
    self.feedbackBtn.center = CGPointMake(self.feedbackBtn.center.x, 25);
    self.feedbackBtn.selected = YES;
    //[self.conetntView addSubview:self.themewishBtn];
    //self.themewishBtn.center = CGPointMake(self.themewishBtn.center.x, 25);
    UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3, 10)];
    lineImage.image = [UIImage imageNamed:@"tabLine"];
    lineImage.center = CGPointMake(ScreenWidth/2.0, 25);
    [self.conetntView addSubview:lineImage];
    
    UIView *contactView = [[UIView alloc] initWithFrame:CGRectMake(0, 25, ScreenWidth, 44)];
    contactView.backgroundColor = SMWhiteColor;
    [contactView addSubview:self.signatureTextField];
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

- (UITextField *)signatureTextField{
    if (!_signatureTextField) {
        _signatureTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 44)];
        _signatureTextField.placeholder = NSLocalizedString(@"填写你的QQ/手机/邮箱", nil);
        _signatureTextField.backgroundColor = SMWhiteColor;
        _signatureTextField.font = [UIFont systemFontOfSize:15];
        _signatureTextField.textColor = SMHexColor(0x272b3c);
        _signatureTextField.returnKeyType = UIReturnKeySend;
        _signatureTextField.delegate = self;
    }
    return _signatureTextField;
    
}

- (void)send{
    [self.view endEditing:YES];
    _Signature = self.signatureTextField.text;
    
    if (_Signature.length == 0){
        [[LoadingAnimation shareInstance]dismissWithError:NSLocalizedString(@"请输入QQ/手机号/邮箱信息", nil)];
        return;
    }
   // _Signature = [_Signature stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([self.delegate respondsToSelector:@selector(changeText:)])  {
        [self.delegate changeText:_Signature];
    }
    //4.掉用代理方法
    
    //回跳转到显示页面
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(_Signature);
    
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
