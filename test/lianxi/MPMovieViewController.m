//
//  MPMovieViewController.m
//  test
//
//  Created by niuy on 2018/3/28.
//  Copyright © 2018年 niuy. All rights reserved.
//
/**************************使用MPMoviePlayerController（iOS9.0之前）使用******************************/

#import "MPMovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MPMovieViewController ()
@property (nonatomic, strong) MPMoviePlayerController *video;
@end
static CGFloat videoPlayNowTime;   //用来记录快进时的播放时间
static BOOL _isSeekingForward;  //用来判断是否从快进恢复到正在播放

@implementation MPMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *urlString = @"http://p3.xyzs.com/movie/2a/9d/100002308/9a7a034ef23c927c0a464a19d89331d4.mov";
    [self videoPlayAction:urlString];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //监听视频播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getVideoPlayState:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)videoPlayAction:(NSString *)videoURL {
//    MPMoviePlayerViewController *video;
//    video = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:videoURL]];
//    [self.navigationController presentViewController:video animated:YES completion:nil];
    

    self.video = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:videoURL]];
    [self.view addSubview:self.video.view];
    self.video.view.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
    [self.video play]; //视频开始播放
    //[video pause]; //视频暂停播放
    
}

/*
 用来监听播放状态发生改变
 MPMoviePlayerPlaybackStateDidChangeNotification
 我们可以用这个属性来监听视频播放状态的变化，当视频被快进时，记录当前播放时间，快进结束恢复正在播放时，让视频从被记录的播放时间开始播放，变相实现视频的禁止快进
 */

//通知调用方法
- (void)getVideoPlayState:(NSNotification *)notification{
    //视频被快进时
    if (self.video.playbackState == MPMoviePlaybackStateSeekingForward) {
        videoPlayNowTime = self.video.currentPlaybackTime;
        _isSeekingForward = YES;
    }
    
    //视频恢复正在播放时
    if (self.video.playbackState == MPMoviePlaybackStatePlaying){
        if (_isSeekingForward) { //判断是否从快进状态恢复到正在播放状态
            _isSeekingForward = NO;
            [self.video setCurrentPlaybackTime:videoPlayNowTime];
            [self.video play];
        }
    }
}

@end
