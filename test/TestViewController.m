//
//  TestViewController.m
//  test
//
//  Created by niuy on 16/12/12.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "TestViewController.h"
//#import ""
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>
@interface TestViewController ()
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self UI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UI {
    //self.view.backgroundColor = [UIColor whiteColor];
    /*
    UIView *letfView = [UIView new];
    UIView *rightView = [UIView new];
    UIView *topView = [[UIView alloc] init];
    UIView *bottomView = [[UIView alloc] init];
    UIView *targetView = [[UIView alloc] init];
    UILabel *FirstLabel = [[UILabel alloc] init];
    UILabel *SecondeLabel = [[UILabel alloc] init];
    
    
    letfView.backgroundColor = [UIColor redColor];
    rightView.backgroundColor = [UIColor greenColor];
    topView.backgroundColor = [UIColor blackColor];
    bottomView.backgroundColor = [UIColor blueColor];
    targetView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:letfView];
    [self.view addSubview:rightView];
    [self.view addSubview:topView];
    [self.view addSubview:bottomView];
    [self.view addSubview:targetView];
    
    
    [letfView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(100);// leftView 上边 = self.view 上边 +100
        make.left.mas_equalTo(self.view).mas_offset(10);// leftView 左边 = self.view 左边 +10
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(letfView);// rightView 上边 = leftView 上边（即上边对齐）
        make.right.mas_equalTo(self.view).mas_offset(-10);// rightView 右边 = self.view 右边 - 10
        make.left.mas_equalTo(letfView.mas_right).mas_offset(10);// rightView 左边 = leftView 右边 + 20
        make.width.mas_equalTo(letfView);// rightView 宽 = leftView 宽
        make.height.mas_equalTo(letfView);// rightView 高 = leftView 高
    }];
    
    
    //添加兄弟控件，不考虑父控件。
    [letfView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(20);
        make.bottom.offset(-20);
        make.trailing.equalTo(rightView.mas_leading).offset(-20);
        make.height.equalTo(@100);
        make.height.equalTo(rightView.mas_height);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
        make.top.equalTo(letfView.mas_top);
        make.width.equalTo(letfView.mas_width);
    }];
    

    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(100);
        make.right.and.left.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).priority(999);
        make.left.and.right.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    /*
    //更新约束
    [topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(300);
    }];
    //
    [bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.top.mas_equalTo(self.view).mas_offset(400);
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.right.mas_equalTo(self.view).mas_offset(-10);
    }];
    
    [targetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.left.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    */
    
    
    
    /*
    // Create views
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:topView];
    
    UIView *topInnerView = [[UIView alloc] init];
    topInnerView.backgroundColor = [UIColor greenColor];
    [topView addSubview:topInnerView];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomView];
    
    UIView *bottomInnerView = [[UIView alloc] init];
    bottomInnerView.backgroundColor = [UIColor blueColor];
    [bottomView addSubview:bottomInnerView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(bottomView);
    }];
    
    // width = height / 3
    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
        make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
        make.center.mas_equalTo(topView);
        
        // 设置优先级
        make.width.height.mas_equalTo(topView).priorityLow();
        make.width.height.lessThanOrEqualTo(topView);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(topView);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    
    // width/height比为1/3.0，要求是同一个控件的属性比例
    [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(bottomView);
        make.center.mas_equalTo(bottomView);
        // 注意，这个multipliedBy的使用只能是设置同一个控件的，比如这里的bottomInnerView，
        // 设置高/宽为3:1
        make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
        
        make.width.height.mas_equalTo(bottomView).priorityLow();
        make.width.height.lessThanOrEqualTo(bottomView);
    }];
    */
    /*
    UIView *sv = [[UIView alloc] init];
    sv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(self.view);
        make.width.mas_equalTo(100); //宽
        make.height.mas_equalTo(100); //高
        make.right.and.left.mas_equalTo(self.view);  //紧靠view
        //make.top.mas_equalTo(100);  //距离上100 ，默认相对于view
        make.top.mas_equalTo(self.view).mas_offset(100);
    }];
    
    
     UIView *bottomView = [[UIView alloc] init];
     bottomView.backgroundColor = [UIColor blueColor];
     [self.view addSubview: bottomView];
     [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
     //make.top.mas_equalTo(topView.mas_bottom).mas_offset(100); //距离topView的底部100距离。
     make.left.and.right.mas_equalTo(self.view);
     make.height.mas_equalTo(100);
}];
     */
    

}



@end
