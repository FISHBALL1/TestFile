//
//  DrawingViewController.m
//  test
//
//  Created by niuy on 17/7/7.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "DrawingViewController.h"
#import "Triangle.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Triangle *triangle=[[Triangle alloc]initWithFrame:CGRectMake(100, 200, 300, 100)];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:triangle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
