//
//  gifViewController.m
//  test
//
//  Created by niuy on 2018/3/5.
//  Copyright © 2018年 niuy. All rights reserved.
//

#import "gifViewController.h"
#import "UIImage+GIF.h"

@interface gifViewController ()
@property (nonatomic, strong) UIImageView *loadingGifImage;

@property (nonatomic, strong) UIImageView *loadingImageView;
@end

@implementation gifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self loadingGifImageView];
    [self loadingAnimation];
}

- (void)loadingGifImageView{
    NSString  *name = @"gif.gif";
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:nil];
    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    
    if (!self.loadingGifImage) {
        self.loadingGifImage = [[UIImageView alloc]init];
    }

    self.loadingGifImage.backgroundColor = [UIColor clearColor];
    self.loadingGifImage.image = [UIImage sd_animatedGIFWithData:imageData];
    self.loadingGifImage.frame = CGRectMake(0, 64, ScreenWidth, ScreenWidth*250.0/750.0);
    [self.view addSubview:self.loadingGifImage];
    [self.view bringSubviewToFront:self.loadingGifImage];
}

- (void)loadingAnimation {
    [self.view addSubview:self.loadingImageView];
    [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
    }];
}

- (UIImageView *)loadingImageView {
    if (!_loadingImageView) {
        NSMutableArray *imgArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<24; i++) {
            NSString *name = [NSString stringWithFormat:@"loading_%05d@3x.png", i]; //例如：loading_00000@3x.PNG
            NSString *imageName = [@"LoadingAnimation.bundle" stringByAppendingPathComponent:name];
            UIImage *image = [UIImage imageNamed:imageName];
            [imgArray addObject:image];
        }
        _loadingImageView = [[UIImageView alloc] init];
        _loadingImageView.animationImages = imgArray;
        _loadingImageView.animationDuration = 1.0;
        [self.loadingImageView startAnimating];
    }
    return _loadingImageView;
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
