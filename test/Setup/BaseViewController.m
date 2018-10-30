//
//  BaseViewController.m
//  SuperM
//
//  Created by hanx on 16/7/21.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "BaseViewController.h"
//#import "LoginViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // [[LoadingAnimation shareInstance]dismiss];
    [self.view setBackgroundColor:SMWhiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
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

#pragma mark - Public Method

- (void)translateViewController:(UIViewController *__nonnull)viewController view:(UIView *__nonnull)view completion:(void (^ __nullable)(void))completion {
    CGPoint initialPoint = [view convertPoint:CGPointZero toView:self.view];
    CGSize initialSize = view.frame.size;
    
    CGPoint finalPoint = CGPointZero;
    CGSize finalSize = self.view.frame.size;
    
    UIView *maskView = [[UIView alloc] initWithFrame:view.frame];
    [maskView setBackgroundColor:[UIColor whiteColor]];
    [maskView setFrame:CGRectMake(initialPoint.x, initialPoint.y, initialSize.width, initialSize.height)];
    [maskView setAlpha:0.0];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.frame];
    [backgroundView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.3]];
    [backgroundView setAlpha:0.0];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [keyWindow addSubview:backgroundView];
    [keyWindow addSubview:maskView];
    
    s_weak_self;
    __weak typeof(UIView *) weakMaskView = maskView;
    __weak typeof(UIView *) weakBackgroundView = backgroundView;
    
    [UIView animateWithDuration:0.25 animations:^{
        [weakMaskView setAlpha:1.0];
        [weakBackgroundView setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [weakMaskView setFrame:CGRectMake(finalPoint.x, finalPoint.y, finalSize.width, finalSize.height)];
        } completion:^(BOOL finished) {
            if (completion) {
                completion();
            }
            [weakSelf.navigationController pushViewController:viewController animated:NO];
            [weakBackgroundView removeFromSuperview];
            [weakSelf animationDismiss:weakMaskView];
        }];
    }];
}

- (void)animationDismiss:(UIView *)view {
    __weak typeof(UIView *) weakView = view;
    [UIView animateWithDuration:0.25 animations:^{
        [weakView setAlpha:0.0];
    } completion:^(BOOL finished) {
        [weakView removeFromSuperview];
    }];
}

/*
- (void)popToLoginWithCompletion:(void (^ __nullable)(BOOL success))completion {
    
    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    [loginViewController setLoginCompletion:completion];
    [self presentViewController:loginViewController animated:YES completion:nil];
}

*/
@end
