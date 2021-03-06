//
//  FMGVideoPlayView.m
//  网络视频播放(AVPlayer)
//
//

#import "FMGVideoPlayView.h"

@interface FMGVideoPlayView()

/* 播放器 */
@property (nonatomic, strong) AVPlayer *player;

// 播放器的Layer
@property (weak, nonatomic) AVPlayerLayer *playerLayer;

/* playItem */
@property (nonatomic, weak) AVPlayerItem *currentItem;

//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

// 记录当前是否显示了工具栏
@property (assign, nonatomic) BOOL isShowToolView;

/* 定时器 */
@property (nonatomic, strong) NSTimer *progressTimer;

/* 工具栏的显示和隐藏 */
@property (nonatomic, strong) NSTimer *showTimer;

/* 工具栏展示的时间 */
@property (assign, nonatomic) NSTimeInterval showTime;

#pragma mark - 监听事件的处理
- (IBAction)playOrPause:(UIButton *)sender;
- (IBAction)switchOrientation:(UIButton *)sender;
- (IBAction)slider;
- (IBAction)startSlider;
- (IBAction)sliderValueChange;

- (IBAction)tapAction:(UITapGestureRecognizer *)sender;
- (IBAction)swipeAction:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *forwardImageView;

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

- (IBAction)completeAction:(id)sender;

@property (nonatomic, copy) void(^completeBlock)();

@end

@implementation FMGVideoPlayView


// 快速创建View的方法
+ (instancetype)videoPlayView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FMGVideoPlayView" owner:nil options:nil] firstObject];
}
- (AVPlayer *)player
{
    if (!_player) {

        // 初始化Player和Layer
        _player = [[AVPlayer alloc] init];
    }
    return _player;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    [self.layer addSublayer:self.playerLayer];
    [self.layer insertSublayer:self.playerLayer atIndex:0];
    
    // 设置工具栏的状态
    self.toolView.alpha = 0;
    self.isShowToolView = NO;
    
    self.forwardImageView.alpha = 0;
    self.backImageView.alpha = 0;
    
    // 设置进度条的内容
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"thumbImage"] forState:UIControlStateNormal];
    [self.progressSlider setMaximumTrackImage:[UIImage imageNamed:@"MaximumTrackImage"] forState:UIControlStateNormal];
    [self.progressSlider setMinimumTrackImage:[UIImage imageNamed:@"MinimumTrackImage"] forState:UIControlStateNormal];
    
    // 设置按钮的状态
    self.playOrPauseBtn.selected = NO;
    
    [self showToolView:YES];
    
    ////监听当视频开始或快进或者慢进或者跳过某段播放
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieJumped:) name:AVPlayerItemTimeJumpedNotification object:nil];
}

- (void)movieJumped:(NSNotification *)notification{
    NSLog(@"我被快进了");
}

#pragma mark - 观察者对应的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        if (AVPlayerItemStatusReadyToPlay == status) {
            [self removeProgressTimer];
//            [self addProgressTimer];
            NSLog(@"AVPlayer Item Status Ready To Play");
            self.playOrPauseBtn.selected = NO;
            [self playOrPause:self.playOrPauseBtn];
        }else {
            [self removeProgressTimer];
        }
    }
}

#pragma mark - 重新布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.playerLayer.frame = self.bounds;
}

#pragma mark - 设置播放的视频
- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
   
    NSURL *url = [NSURL URLWithString:urlString];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.currentItem = item;
    
    [self.player replaceCurrentItemWithPlayerItem:self.currentItem];
    
    [self.currentItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setCompleteBlock:(void (^)())completeBlock {
    _completeBlock = completeBlock;
}

// 是否显示工具的View
- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [self showToolView:!self.isShowToolView];
//    [self removeShowTimer];
//    if (self.isShowToolView) {
//        [self showToolView:YES];
//    }
}

- (IBAction)swipeAction:(UISwipeGestureRecognizer *)sender {
    [self swipeToRight:YES];
}

- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender {
    [self swipeToRight:NO];
}

- (void)swipeToRight:(BOOL)isRight
{
    // 1.获取当前播放的时间
    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentItem.currentTime);
    
    if (isRight) {
        [UIView animateWithDuration:1 animations:^{
            self.forwardImageView.alpha = 1;
        } completion:^(BOOL finished) {
            self.forwardImageView.alpha = 0;
        }];
        currentTime += 10;
        
    } else {
        [UIView animateWithDuration:1 animations:^{
            self.backImageView.alpha = 1;
        } completion:^(BOOL finished) {
            self.backImageView.alpha = 0;
        }];
        currentTime -= 10;
        
    }
    
    if (currentTime >= CMTimeGetSeconds(self.player.currentItem.duration)) {
        
        currentTime = CMTimeGetSeconds(self.player.currentItem.duration) - 1;
    } else if (currentTime <= 0) {
        currentTime = 0;
    }
    
    [self.player seekToTime:CMTimeMakeWithSeconds(currentTime, NSEC_PER_SEC) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
    
    [self updateProgressInfo];
}




- (void)showToolView:(BOOL)isShow
{
    if (self.progressSlider.tag == 100) {
        
//            [self showToolView:YES];
        [self removeShowTimer];
        self.progressSlider.tag = 20;
        return;
    
    }
    [UIView animateWithDuration:1.0 animations:^{
        self.toolView.alpha = !self.isShowToolView;
        self.isShowToolView = !self.isShowToolView;
    }];
}

// 暂停按钮的监听
- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender == nil) {
        self.playOrPauseBtn.selected = NO;
    }
    if (sender.selected) {
        [self.player play];
        [self addShowTimer];
        [self addProgressTimer];
    } else {
        [self.player pause];
        [self removeShowTimer];
        [self removeProgressTimer];
    }
}

#pragma mark - 定时器操作
- (void)addProgressTimer
{
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
}

- (void)removeProgressTimer
{
    [self.progressTimer invalidate];
    self.progressTimer = nil;
}

- (void)updateProgressInfo
{
    // 1.更新时间
    self.timeLabel.text = [self timeString];
    
    self.progressSlider.value = CMTimeGetSeconds(self.player.currentTime) / CMTimeGetSeconds(self.player.currentItem.duration);
    
    if(self.progressSlider.value == 1) {
        [self completeAction:nil];
    }

}

- (NSString *)timeString
{
    NSTimeInterval duration = CMTimeGetSeconds(self.player.currentItem.duration);
    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentTime);
//    if (self.player == nil) {
//        return @"00:00/00:00";
//    }
    return [self stringWithCurrentTime:currentTime duration:duration];
}

- (void)addShowTimer
{
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateShowTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.showTimer forMode:NSRunLoopCommonModes];
}

- (void)removeShowTimer
{
    [self.showTimer invalidate];
    self.showTimer = nil;
}

- (void)updateShowTime
{
    self.showTime += 1;
    
    if (self.showTime > 2.0) {
        [self tapAction:nil];
        [self removeShowTimer];
        
        self.showTime = 0;
    }
}

#pragma mark - 切换屏幕的方向
- (IBAction)switchOrientation:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    [UIView animateWithDuration:0.5f animations:^{
        if (sender.selected) {
            [self setBounds:CGRectMake(0, 0, CGRectGetHeight([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds))];
            [self setCenter:[self superview].center];
            
            self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI / 2);
        } else {
            self.transform = CGAffineTransformIdentity;
            [self setFrame:[UIScreen mainScreen].bounds];
        }
    }];
}


- (IBAction)slider {
//    [self addProgressTimer];
    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentItem.duration) * self.progressSlider.value;
    [self.player seekToTime:CMTimeMakeWithSeconds(currentTime, NSEC_PER_SEC) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
}

- (IBAction)startSlider {
    [self removeProgressTimer];

}

- (IBAction)sliderValueChange {
    [self removeProgressTimer];
    [self removeShowTimer];
    if (self.progressSlider.value == 1) {
        self.progressSlider.value = 0;
    }
    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentItem.duration) * self.progressSlider.value;
    NSTimeInterval duration = CMTimeGetSeconds(self.player.currentItem.duration);
    self.timeLabel.text = [self stringWithCurrentTime:currentTime duration:duration];
    [self addShowTimer];
    [self addProgressTimer];
}

- (NSString *)stringWithCurrentTime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration
{
//    if (currentTime == duration) {
//        currentTime = 0;
//
////        self.player.currentTime = currentTime;
////        [self updateProgressInfo];
////        [self sliderValueChange];
////        self.progressSlider.value = 0;
//        self.playOrPauseBtn.selected = NO;
//        self.toolView.alpha = 1;
//        
//        [self removeProgressTimer];
//        [self removeShowTimer];
//        self.player = nil;
//        
//    }
    NSInteger dMin = duration / 60;
    NSInteger dSec = (NSInteger)duration % 60;
    
    NSInteger cMin = currentTime / 60;
    NSInteger cSec = (NSInteger)currentTime % 60;
    
    NSString *durationString = [NSString stringWithFormat:@"%02ld:%02ld", dMin, dSec];
    NSString *currentString = [NSString stringWithFormat:@"%02ld:%02ld", cMin, cSec];
    
    return [NSString stringWithFormat:@"%@/%@", currentString, durationString];
}

#pragma - 播放完成

- (IBAction)completeAction:(id)sender {
    self.progressSlider.value = 0;
    self.progressSlider.tag = 100;
    //        [self playOrPause:nil];
    //        [self sliderValueChange];
    self.player = nil;
    self.playOrPauseBtn.selected = NO;
    self.toolView.alpha = 1;
    
    [self removeProgressTimer];
    [self removeShowTimer];
    self.timeLabel.text = @"00:00/00:00";
    
    if (self.completeBlock) {
        self.completeBlock();
    }
    NSLog(@"播放完毕");
}

- (void)dealloc {
    [self.currentItem removeObserver:self forKeyPath:@"status" context:nil];
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemTimeJumpedNotification object:nil];
}

@end
