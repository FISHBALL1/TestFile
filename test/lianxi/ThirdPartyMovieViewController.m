//
//  ThirdPartyMovieViewController.m
//  test
//
//  Created by niuy on 2018/3/29.
//  Copyright © 2018年 niuy. All rights reserved.
//

#import "ThirdPartyMovieViewController.h"

@interface ThirdPartyMovieViewController ()
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic) CGPoint mPtLast;
@end

@implementation ThirdPartyMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.image = [[UIImageView alloc] init];
    self.image.layer.cornerRadius = 25;
    self.image.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.image];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.centerX.centerY.mas_equalTo(self.view);
    }];
    
    //[self moveImageAnimation];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1) {
        NSLog(@"单手指触摸");
    }else if(touch.tapCount == 2) {
        NSLog(@"双手指触摸");
    }else if (touch.tapCount == 3) {
        NSLog(@"三手指触摸");
    }
    
    //self.mPtLast = [touch locationInView:self.view];
    self.mPtLast = [touch locationInView:self.image];
    NSLog(@"point  = %@",NSStringFromCGPoint(self.mPtLast));
}


//平移动画方法
- (void)moveImageAnimation{
    // X轴横向移动
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    // 1秒后执行
    animation.beginTime = CACurrentMediaTime() + 1;
    // 动画持续时间
    animation.duration = 2.5;
    // 重复次数
    animation.repeatCount = INT_MAX;
    //自动重复
    animation.autoreverses = YES;
    //移动距离
    animation.toValue = @(100);
    //给image添加动画
    [self.image.layer addAnimation:animation forKey:@"move"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
