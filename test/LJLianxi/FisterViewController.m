//
//  FisterViewController.m
//  test
//
//  Created by niuy on 17/10/16.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "FisterViewController.h"
#import "BlockViewController.h"

@interface FisterViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *clickBtn;


@end

@implementation FisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [[UILabel alloc] init];
    _label.backgroundColor = [UIColor redColor];
    _label.textColor = [UIColor blackColor];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(100);
    }];
    
    _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clickBtn setTitle:@"按钮" forState:UIControlStateNormal];
    [_clickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_clickBtn addTarget:self action:@selector(acction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clickBtn];
    [self.clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.label.mas_bottom).mas_offset(10);
    }];
    

}

- (void)acction {
    
    //在接收值得页面里实现Block
    BlockViewController *secondVC = [[BlockViewController alloc]init];

    __weak typeof(self) __weakSelf = self;
    secondVC.returnTextBlock = ^(NSString *str){
        __weakSelf.label.text = str;
    };

    [self.navigationController pushViewController:secondVC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
