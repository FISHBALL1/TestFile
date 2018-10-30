//
//  TestScroll2ViewController.m
//  test
//
//  Created by niuy on 17/6/29.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "TestScroll2ViewController.h"
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 568 
#define IMAGEVIEW_COUNT 5

@interface TestScroll2ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSMutableDictionary *imageData;
@property (nonatomic) int currentImageIndex;  //当前图片索引
@property (nonatomic) int imageCount;   //图片总数

@property (nonatomic, strong) UIScrollView *bannerView;

@end

@implementation TestScroll2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self bannerView];
    
    //加载数据
    [self loadImageData];
    //添加滚动控件
    [self addScrollView];
    //添加图片控件
    [self addImageViews];
    //添加分页控件
    [self addPageControl];
    //添加图片描述控件
    [self addLabel];
    //添加默认图片
    [self setDefaultImage];
}
/*
- (UIScrollView *)bannerView {
    if (!_bannerView) {
        //Banner
        _bannerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 350)]; //(0, 0, 320, 200)
        _bannerView.contentSize = CGSizeMake(ScreenWidth*5, 200);//(320*5, 200)
        [_bannerView flashScrollIndicators];
        float _x = 0;
        for (int index = 1 ; index < 6; index ++) {
            UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(_x + 0, 0, ScreenWidth, 350)];//_x + 0, 0, ScreenWidth, 200
            NSString *imagename = [NSString stringWithFormat:@"image%d.jpg",index];
            imageview.image = [UIImage imageNamed:imagename];
            
            [_bannerView addSubview:imageview];
            _x = _x + ScreenWidth;//320
        }
        _bannerView.delegate = self;
        _bannerView.bounces = YES;
        _bannerView.pagingEnabled = YES;
        //隐藏滚动条
        _bannerView.showsHorizontalScrollIndicator = NO;
        _bannerView.showsVerticalScrollIndicator = YES;
        _bannerView.backgroundColor = [UIColor whiteColor];
        //[self.cell.contentView addSubview:_bannerView];
        [self.view addSubview:_bannerView];
        
        UIPageControl *page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 310, ScreenWidth, 30)];//(0, 175, 320, 30)
        page.numberOfPages = 5;
        page.tag = 101;
        //[self.cell.contentView addSubview:page];
        [self.view addSubview:page];
    }
    return _bannerView;
}
*/

#pragma mark 加载图片资源
- (void)loadImageData {
    //读取程序包路径中的资源文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imageInfo" ofType:@"plist"];
    _imageData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    _imageCount = (int)_imageData.count;
}

#pragma mark 添加控件
- (void)addScrollView{
    //_scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 350)];;
    [self.view addSubview:_scrollView];
    
    //设置代理
    _scrollView.delegate = self;
    //设置contentSize
    _scrollView.contentSize =  CGSizeMake(IMAGEVIEW_COUNT*SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置当前显示的位置为中间图片
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    //设置分页
    _scrollView.pagingEnabled = YES;
    //去掉滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
}

#pragma mark 添加图片三个控件
- (void)addImageViews {
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImageView];
}

#pragma mark 设置默认显示图片
- (void)setDefaultImage {
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%i.jpeg",_imageCount-1]];
    _centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"image%i.jpeg",0]];
    _rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"image%i.jpeg",1]];
    _currentImageIndex = 0;
    //设置当前页
    _pageControl.currentPage = _currentImageIndex;
    NSString *imageName = [NSString stringWithFormat:@"image%i.jpeg",_currentImageIndex];
    _label.text = _imageData[imageName];
}

#pragma mark 添加分页控件
- (void)addPageControl {
    _pageControl = [[UIPageControl alloc] init];
    //此方法可以根据页面数返回UIPageControl合适的大小
    CGSize size = [_pageControl sizeForNumberOfPages:_imageCount];
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-100);
    //设置颜色
    _pageControl.pageIndicatorTintColor=[UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    //设置当前页颜色
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    //设置总页数
    _pageControl.numberOfPages=_imageCount;
    [self.view addSubview:_pageControl];
}

#pragma mark 添加信息描述控件
-(void)addLabel{
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH,30)];
    _label.textAlignment=NSTextAlignmentCenter;
    _label.textColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    
    [self.view addSubview:_label];
}

#pragma mark 滚动停止事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //重新加载图片
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    _pageControl.currentPage = _currentImageIndex;
    //设置描述
    NSString *imageName=[NSString stringWithFormat:@"%i.jpg",_currentImageIndex];
    _label.text=_imageData[imageName];
    
}

#pragma mark 重新加载图片
- (void)reloadImage {
    
    int leftImageIndex,rightImageIndex;
    CGPoint offset=[_scrollView contentOffset];
    if (offset.x>SCREEN_WIDTH) { //向右滑动
        _currentImageIndex=(_currentImageIndex+1)%_imageCount;
    }else if(offset.x<SCREEN_WIDTH){ //向左滑动
        _currentImageIndex=(_currentImageIndex+_imageCount-1)%_imageCount;
    }
    //UIImageView *centerImageView=(UIImageView *)[_scrollView viewWithTag:2];
    _centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_currentImageIndex]];
    
    //重新设置左右图片
    leftImageIndex=(_currentImageIndex+_imageCount-1)%_imageCount;
    rightImageIndex=(_currentImageIndex+1)%_imageCount;
    _leftImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",leftImageIndex]];
    _rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",rightImageIndex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
