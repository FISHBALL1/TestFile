//
//  PaoMaDengViewController.m
//  test
//
//  Created by niuy on 2018/3/20.
//  Copyright © 2018年 niuy. All rights reserved.
//

#import "PaoMaDengViewController.h"

@interface PaoMaDengViewController ()
@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) NSString *scrollText;
@end

@implementation PaoMaDengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self scrollAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollAnimation {
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, mainRect.size.width, 100)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    self.scrollText = @"这是一条有意思的公告";
    CGFloat width = [self textWidth:self.scrollText];
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,60,width,30)];
    self.testLabel.backgroundColor = [UIColor clearColor];
    self.testLabel.text = self.scrollText;
    [bgView addSubview:self.testLabel];
    [self linearAnimation];
}

-(void)linearAnimation {
    CGRect frame = self.testLabel.frame;
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.testLabel.frame = CGRectMake(-frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        CGRect mainRect = [[UIScreen mainScreen] bounds];
        CGFloat width = [self textWidth:self.scrollText];
        self.testLabel.frame = CGRectMake(mainRect.size.width, 60, width, 30);
        [self linearAnimation];
    }];
}

-(CGFloat)textWidth:(NSString *)text {
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} context:nil].size;
    return size.width;
}




/*
 ///////
 -(void)scrollAnimation {
 self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
 self.bgView.backgroundColor = [UIColor blueColor];
 [self.headView addSubview:self.bgView];
 //[self.view bringSubviewToFront:bgView];
 self.scrollText = @"这是一条有意思的公告";
 CGFloat width = [self textWidth:self.scrollText];
 self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,width,30)];
 self.testLabel.text = self.scrollText;
 self.testLabel.textColor = [UIColor whiteColor];
 [self.bgView addSubview:self.testLabel];
 
 self.testLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0,0,width,30)];
 self.testLabel2.text = self.scrollText;
 self.testLabel2.textColor = [UIColor whiteColor];
 [self.bgView addSubview:self.testLabel2];
 
 //    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
 //    closeBtn.backgroundColor = [UIColor blueColor];
 //    closeBtn.frame = CGRectMake(ScreenWidth-100, 5, 30, 40);
 //    closeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
 //    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
 //    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
 //    [self.bgView addSubview:closeBtn];
 [self linearAnimation];
 __showLayer(self.testLabel);
 }
 
 -(void)linearAnimation {
 CGRect frame = self.testLabel.frame;
 [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
 self.testLabel.frame = CGRectMake(-frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
 
 //CGFloat width = [self textWidth:self.scrollText];
 self.testLabel2.frame = CGRectMake(-frame.size.width + frame.size.width + 50, frame.origin.y, frame.size.width, frame.size.height);
 
 } completion:^(BOOL finished) {
 CGFloat width = [self textWidth:self.scrollText];
 self.testLabel.frame = CGRectMake(ScreenWidth, 0, width, 30);
 
 self.testLabel2.frame = CGRectMake(ScreenWidth+width, 0, width, 30);
 [self linearAnimation];
 }];
 }
 
 -(CGFloat)textWidth:(NSString *)text {
 //    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} context:nil].size;
 //    return size.width;
 
 
 CGFloat width = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}].width;
 return width;
 }
 
 - (void)closeAction {
 [self.bgView removeFromSuperview];
 
 }
 */

@end
