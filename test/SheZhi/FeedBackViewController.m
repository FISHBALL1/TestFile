//
//  FeedBackViewController.m
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "FeedBackViewController.h"
#import "UIView+Expand.h"
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
@interface FeedBackViewController ()<UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextField *contactTextField;
@property (nonatomic, strong) UIButton *feedbackBtn;
@property (nonatomic, strong) UIButton *themewishBtn;
@property (nonatomic, strong) UIView *conetntView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"意见反馈", nil);
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
    
    [self.conetntView addSubview:self.textView];
    
    UIView *contactView = [[UIView alloc] initWithFrame:CGRectMake(0, 219, ScreenWidth, 44)];
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
        NSString *title = NSLocalizedString(@"发送", nil);
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
/*
- (UIButton *)feedbackBtn{
    if (!_feedbackBtn) {
        _feedbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_feedbackBtn setTitle:NSLocalizedString(@"问题反馈", nil) forState:UIControlStateNormal];
        _feedbackBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_feedbackBtn setTitleColor:SMHexColor(0x009cff) forState:UIControlStateNormal];
        [_feedbackBtn addTarget:self action:@selector(feedbackTouched) forControlEvents:UIControlEventTouchUpInside];
        _feedbackBtn.selected = YES;
        _feedbackBtn.frame =CGRectMake((ScreenWidth *0.5 - 120)-10, 0, 120, 46);
    }
    return _feedbackBtn;
}
 */
/*
- (UIButton *)themewishBtn{
    if (!_themewishBtn) {
        _themewishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_themewishBtn setTitle:NSLocalizedString(@"主题愿望", nil) forState:UIControlStateNormal];
        _themewishBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_themewishBtn setTitleColor:SMHexColor(0x595d71) forState:UIControlStateNormal];
        [_themewishBtn addTarget:self action:@selector(themewishTouched) forControlEvents:UIControlEventTouchUpInside];
        _themewishBtn.frame =CGRectMake(ScreenWidth *0.5 + 10, 0, 120, 46);
    }
    return _themewishBtn;
}
*/
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, 149)];
        _textView.textColor = SMHexColor(0x272b3c);
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.backgroundColor = SMWhiteColor;
        _textView.returnKeyType = UIReturnKeyNext;
        _textView.textContainerInset = UIEdgeInsetsMake(15, 10, 15, 10);
        _textView.delegate = self;
        [_textView addSubview:self.placeholderLabel];
    }
    return _textView;
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

- (UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 15)];
        _placeholderLabel.text = NSLocalizedString(@"告诉我们你遇到的问题", nil);
        [_placeholderLabel sizeToFit];
        _placeholderLabel.textColor = SMHexColor(0xc6c9d2);
        _placeholderLabel.font = [UIFont systemFontOfSize:15];
    }
    return _placeholderLabel;
}

- (void)send{
    [self.view endEditing:YES];
    NSString *content = self.textView.text;
    NSString *contact = self.contactTextField.text;
    if (content.length == 0) {
        [[LoadingAnimation shareInstance] dismissWithError:NSLocalizedString(@"请先输入信息哦!", nil)];
        return;
    }else if (contact.length == 0){
        [[LoadingAnimation shareInstance]dismissWithError:NSLocalizedString(@"请输入QQ/手机号/邮箱信息", nil)];
        return;
    }
    /*
    else if (![contact isValidFeedbackContact]){
        [[LoadingAnimation shareInstance]dismissWithError:NSLocalizedString(@"请输入正确的QQ/手机号/邮箱信息", nil)];
        return;
    }
     */
    content = [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    contact = [contact stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    /*
    if (self.feedbackBtn.selected) {
        [SRequestCenter sRequestCenterFeedbackWithContent:content contact:contact success:^(NSObject *obj) {
            [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"发送成功", nil)];
            self.textView.text = @"";
            self.contactTextField.text = @"";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
            
        } failure:^(NSError *error) {
            [[LoadingAnimation shareInstance] dismissWithError:NSLocalizedString(@"发送失败", nil)];
            SDEBUGLOG(@"%@",error);
        }];
    }else{
        [SRequestCenter sRequestCenterThemewishWithContent:content contact:contact success:^(NSObject *obj) {
            [[LoadingAnimation shareInstance] showWithComplete:NSLocalizedString(@"发送成功", nil)];
            self.textView.text = @"";
            self.contactTextField.text = @"";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
            
        } failure:^(NSError *error) {
            [[LoadingAnimation shareInstance] dismissWithError:NSLocalizedString(@"发送失败", nil)];
            SDEBUGLOG(@"%@",error);
        }];
    }*/
}

- (void)feedbackTouched{
    [self.feedbackBtn setTitleColor:SMHexColor(0x009cff) forState:UIControlStateNormal];
    [self.themewishBtn setTitleColor:SMHexColor(0x595d71) forState:UIControlStateNormal];
    [self.view endEditing:YES];
    self.feedbackBtn.selected = YES;
    self.themewishBtn.selected = NO;
    self.placeholderLabel.text = NSLocalizedString(@"告诉我们你遇到的问题", nil);
}

- (void)themewishTouched{
    [self.feedbackBtn setTitleColor:SMHexColor(0x595d71) forState:UIControlStateNormal];
    [self.themewishBtn setTitleColor:SMHexColor(0x009cff) forState:UIControlStateNormal];
    [self.view endEditing:YES];
    self.feedbackBtn.selected = NO;
    self.themewishBtn.selected = YES;
    self.placeholderLabel.text = NSLocalizedString(@"告诉我们你想要的主题", nil);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -- UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (self.keyboardHeight>ScreenHeight-263) {
        [UIView animateWithDuration:0.25 animations:^{
            self.conetntView.top = [self getStartOriginY]-(self.keyboardHeight-(ScreenHeight-263));
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.25 animations:^{
        self.conetntView.top = [self getStartOriginY];
    }];
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length>0) {
        self.placeholderLabel.hidden = YES;
    }else{
        self.placeholderLabel.hidden = NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([@"\n" isEqualToString:text]) {
        [self.contactTextField becomeFirstResponder];
    }
    return YES;
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
