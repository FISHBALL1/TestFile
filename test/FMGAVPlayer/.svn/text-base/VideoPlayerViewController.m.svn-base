//
//  VideoPlayerViewController.m
//  EGameForum
//
//  Created by huangd on 2017/7/6.
//  Copyright © 2017年 huangd. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "FMGVideoPlayView.h"

@interface VideoPlayerViewController ()

@property (weak, nonatomic) FMGVideoPlayView *playView;

@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view setBackgroundColor:[UIColor blackColor]];

    [self.playView setUrlString:self.urlString];
    [self.view addSubview:self.playView];

    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)complete {
    [self dismissViewControllerAnimated:YES completion:^{}];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
}

- (FMGVideoPlayView *)playView {
    if (!_playView) {
        _playView = [FMGVideoPlayView videoPlayView];
        _playView.frame = [UIScreen mainScreen].bounds;
        _playView.contrainerViewController = self;
        
        __weak typeof(self) weakself = self;
        [_playView setCompleteBlock:^{
            [weakself complete];
        }];
    }
    return _playView;
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
