//
//  SportsShakeViewController.m
//  test
//
//  Created by niuy on 17/7/6.
//  Copyright © 2017年 niuy. All rights reserved.
//
//通过摇一摇运动来切换图片
#import "SportsShakeViewController.h"
#define KImageCount 3

@interface SportsShakeViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SportsShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"摇一摇换图片";
    self.view.backgroundColor = [UIColor whiteColor];
    [self imageView];
}

#pragma mark 视图显示时让控件变成第一响应者
- (void)viewWillDisappear:(BOOL)animated {
    [_imageView becomeFirstResponder];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 500, 300)];
        _imageView.userInteractionEnabled = YES;
        _imageView.image = [UIImage imageNamed:@"image0"];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark 视图不显示时让控件失去第一响应者
- (void) viewDidAppear:(BOOL)animated {
    [_imageView resignFirstResponder];
}

- (void)getImageView {
    int index = arc4random()%KImageCount;
    NSString *imageName = [NSString stringWithFormat:@"image%i",index];
    _imageView.image = [UIImage imageNamed:imageName];
}

#pragma mark - 设置控件可以成为第一响应者
- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark 运动开始
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    //这里只处理摇晃事件
    if (motion == UIEventSubtypeMotionShake) {
        [self getImageView];
    }
}

#pragma mark 运动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
