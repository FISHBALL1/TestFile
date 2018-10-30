//
//  TestUIViewController.m
//  test
//
//  Created by niuy on 17/6/23.
//  Copyright © 2017年 niuy. All rights reserved.
//

//关于动画的制作一些方法.. 选择、缩放

//制作animateWithDuration动画效果

#import "TestUIViewController.h"

typedef void(^ ButtonHandle)();

@interface TestUIViewController (){
    UIImageView *_imageView;
    UIButton *_btnRotation;
    UIButton *_btnScale;
    UIButton *_btnTranslate;
}

@end

@implementation TestUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addImageView];
    [self addRotationButton];
    [self addScaleButton];
    
}

#pragma mark 添加图片控件
- (void)addImageView {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 120, 280, 154)];
    _imageView.image = [UIImage imageNamed:@"image2.jpeg"];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
}

#pragma mark 添加旋转按钮
- (void)addRotationButton {
    _btnRotation = [self getButton];
    _btnRotation.frame = CGRectMake(150, 400, 280, 30);
    [_btnRotation setTitle:@"旋转" forState:UIControlStateNormal];
    [_btnRotation addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRotation];
}

#pragma mark 添加缩放按钮
- (void)addScaleButton {
    _btnScale = [self getButton];
    _btnScale.frame = CGRectMake(150, _btnRotation.frame.origin.y + 40, 280, 30);
    [_btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    [_btnScale addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnScale];
    
}

#pragma mark 图片旋转方法
- (void)rotation:(UIButton *)btn {
    //自定义的动画函数
    [self animation:^{
        //旋转的角度
        CGFloat angle =  M_PI;
        _imageView.transform = CGAffineTransformRotate(_imageView.transform, angle);
    }];
}

#pragma mark 图片缩放方法
- (void)scale:(UIButton *)btn {
    // 1. 使用系统的动画函数
    [UIView animateWithDuration:0.5 animations:^ {
        CGFloat scalleOffset = 0.9;
        _imageView.transform = CGAffineTransformScale(_imageView.transform, scalleOffset, scalleOffset);
    }];
    
    /*2.
    [UIView animateWithDuration:0.5 delay:0.1 options:(UIViewAnimationOptions) animations:^{
        
        //执行动画的代码
    } completion:^(BOOL finished) {
        //动画执行完毕之后执行的代码
    }]
    */
    
   /*3.
    [UIView animateWithDuration:0.5 animations:^{

         } completion:^(BOOL finished) {
             
         }]
    */
    
    /*
     duration为动画持续的时间。
     animations为动画效果的代码块。
     completion为动画执行完毕以后执行的代码块
     options为动画执行的选项。可以参考这里
     delay为动画开始执行前等待的时间
     
     下面是可以设置动画效果的属性：
     frame
     
     bounds
     
     center
     
     transform
     
     alpha
     
     backgroundColor
     
     contentStretch
     */
}

#pragma mark 动画执行方法
- (void)animation:(ButtonHandle)handle {
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    handle();
    //执行动画操作
    [UIView commitAnimations];
    
}

#pragma mark 统一按钮样式
- (UIButton *)getButton {
    UIButton *button = [[UIButton alloc] init];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
