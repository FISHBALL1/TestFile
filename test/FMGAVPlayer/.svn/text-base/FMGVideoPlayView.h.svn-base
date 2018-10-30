//
//  FMGVideoPlayView.h
//  网络视频播放(AVPlayer)
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FMGVideoPlayView : UIView

+ (instancetype)videoPlayView;

//@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, copy) NSString *urlString;

/* 包含在哪一个控制器中 */
@property (nonatomic, weak) UIViewController *contrainerViewController;

- (void)setCompleteBlock:(void (^)())completeBlock;

@end
