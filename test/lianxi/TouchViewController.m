//
//  TouchViewController.m
//  test
//
//  Created by niuy on 17/7/3.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "TouchViewController.h"


@interface TouchViewController ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_image = [[UIImage alloc] initwi]
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 150, 169)];
    _imageView.image = [UIImage imageNamed:@"image3"];
    [self.view addSubview:_imageView];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark 视图控制器触摸事件
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIViewController start touch...");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //取得一个触摸对象（对于多点触摸可能有多个对象）
    UITouch *touch=[touches anyObject];
    //NSLog(@"%@",touch);
    
    //取得当前位置
    CGPoint current=[touch locationInView:self.view];
    //取得前一个位置
    CGPoint previous=[touch previousLocationInView:self.view];
    
    //移动前的中点位置
    CGPoint center= _imageView.center;
    //移动偏移量
    CGPoint offset=CGPointMake(current.x-previous.x, current.y-previous.y);
    
    //重新设置新位置
    _imageView.center=CGPointMake(center.x+offset.x, center.y+offset.y);
    
    NSLog(@"UIViewController moving...");
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIViewController touch end.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
