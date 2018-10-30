//
//  BlockViewController.m
//  test
//
//  Created by niuy on 17/10/16.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "BlockViewController.h"
#import "FisterViewController.h"

@interface BlockViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] init];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.textColor = [UIColor blackColor];
    _textField.delegate = self;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.placeholder = @"请输入";
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(100);
    }];
    
    _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clickBtn setTitle:@"按钮" forState:UIControlStateNormal];
    [_clickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_clickBtn addTarget:self action:@selector(btnAcction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clickBtn];
    [self.clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.textField.mas_bottom).mas_offset(10);
    }];
}

- (void)btnAcction {
    //第二步在我们的传值页面里需要传值的地方调用Block方法，，这里是将传值页面中的textField的传递给了接收的页面
    self.returnTextBlock(self.textField.text);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
