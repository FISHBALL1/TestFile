//
//  AVMovieViewController.m
//  test
//
//  Created by niuy on 2018/3/28.
//  Copyright © 2018年 niuy. All rights reserved.
//

#import "AVMovieViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "VideoPlayerViewController.h"

@interface AVMovieViewController ()
@property (nonatomic, strong) AVPlayerViewController *playerController;
@property (nonatomic, strong) AVPlayer *avPlayer;
@end

@implementation AVMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.hidden = YES;
    
    UIButton * playVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    playVideoButton.center = self.view.center;
    playVideoButton.backgroundColor = [UIColor grayColor];
    [playVideoButton setTitle:@"点击播放" forState:UIControlStateNormal];
    [playVideoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playVideoButton addTarget:self action:@selector(playeVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playVideoButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playeVideo {
    
    //[self addAVPlayer];
    //[self playMovieVideo];
    
    NSString *urlString = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    VideoPlayerViewController *video = [[VideoPlayerViewController alloc] init];
    [video setUrlString:urlString];
    [self.navigationController presentViewController:video animated:YES completion:nil];
    
}

- (void)playMovieVideo {

    NSURL * videoURL = [NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    self.playerController = [[AVPlayerViewController alloc] init];
    self.playerController.player = [[AVPlayer alloc] initWithURL:videoURL];
    
    self.playerController.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.playerController.player play]; //开始
    
    [self presentViewController:self.playerController animated:YES completion:nil];
}


#pragma mark - Notic
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //Notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieJumped:) name:AVPlayerItemTimeJumpedNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieStalle:) name:AVPlayerItemPlaybackStalledNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backGroundPauseMoive) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)dealloc {
    //移除监听
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemPlaybackStalledNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemTimeJumpedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//通知调用方法
- (void)movieToEnd:(NSNotification *)notification{
    NSLog(@"我被中断了");
}







#pragma mark - AVPlay
- (void)addAVPlayer {
    NSString *urlString = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    NSURL *url = [NSURL URLWithString:urlString];
    //初始化
    self.playerController = [[AVPlayerViewController alloc]init];
    
    //AVPlayerItem 视频的一些信息  创建AVPlayer使用的
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:url];
    
    //通过AVPlayerItem创建AVPlayer
    self.avPlayer = [[AVPlayer alloc]initWithPlayerItem:item];
    
    //给AVPlayer一个播放的layer层
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    
    layer.frame = self.view.bounds;
    
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    self.playerController.view.center = self.view.center;
    
    //设置AVPlayer的填充模式
    layer.videoGravity = AVLayerVideoGravityResizeAspect;  //等比例填充，直到一个维度到达区域边界;
    
    //添加layer层
    [self.view.layer addSublayer:layer];
    
    //设置AVPlayerViewController内部的AVPlayer为刚创建的AVPlayer
    self.playerController.player = self.avPlayer;
    // 是否显示播放控制条
    self.playerController.showsPlaybackControls = YES;
    
    [self.playerController.player play]; //开始
    
}







@end
