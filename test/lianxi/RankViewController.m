//
//  RankViewController.m
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.


#define DeclareWeakSelf __weak typeof(self) weakSelf = self;
#define MainScale       ([UIScreen mainScreen].scale)
#define kWindowKey @"window"
#define kWindowHomePage @"A"

#import "RankViewController.h"
#import "HMSegmentedControl.h"
#import "ScoreRankViewController.h"
#import "PopularRankViewController.h"

@interface RankViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIPageViewController *containerViewController;
@end

@implementation RankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"分页";
    
    [self.view addSubview:self.segmentedControl];
    
    // Do any additional setup after loading the view.
    NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                            
                                                       forKey: UIPageViewControllerOptionSpineLocationKey];
    self.containerViewController =[[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    
    
    // 设置UIPageViewController对象的代理
    
    self.containerViewController.dataSource = self;
    self.containerViewController.delegate = self;
    
    // 定义“这本书”的尺寸
    
    [[self.containerViewController view] setFrame:[[self view] bounds]];
    self.viewControllers =[NSArray arrayWithObjects:[ScoreRankViewController new],[PopularRankViewController new],nil];
    
    [self.containerViewController setViewControllers:@[[self.viewControllers firstObject] ]
     
                                           direction:UIPageViewControllerNavigationDirectionForward
     
                                            animated:NO
     
                                          completion:nil];
    self.containerViewController.view.frame = CGRectMake(0, (SafeTopHeight+40), ScreenWidth, (ScreenHeight-SafeTopHeight-40-SafeBottomHeight));
    [[self view] addSubview:[self.containerViewController view]];
    [self addChildViewController:self.containerViewController];
    // [self setupTopStyle];
    
    
}

- (HMSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"评分榜",@"人气榜"]];
        _segmentedControl.frame = CGRectMake((ScreenWidth-200)/2, SafeTopHeight, 200, 40);
        
        _segmentedControl.layer.cornerRadius = 20;
        _segmentedControl.scrollView.layer.cornerRadius = 20;
        _segmentedControl.scrollView.backgroundColor = [UIColor blackColor];
        
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        _segmentedControl.selectionIndicatorBoxLayer.cornerRadius = 20;
        _segmentedControl.selectionIndicatorBoxColor = [UIColor redColor];
        _segmentedControl.selectionIndicatorBoxOpacity =  1.0;
        
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
//        _segmentedControl.selectionIndicatorColor = [UIColor redColor]; //下划线颜色
//        _segmentedControl.selectionIndicatorHeight = 2.0;
//        _segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -5, 0);
        
        
        _segmentedControl.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor grayColor]};
        _segmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]};

        DeclareWeakSelf
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
            if (index == 0) direction = UIPageViewControllerNavigationDirectionReverse;
            [weakSelf.containerViewController setViewControllers:@[weakSelf.viewControllers[index]] direction:direction animated:YES completion:nil];
        }];
    }
    return _segmentedControl;
}

#pragma  UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =[self.viewControllers indexOfObject:viewController];
    if ((index == 0) || (index == NSNotFound)) {
        
        return nil;
        
    }
    
    index--;
    
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法，自动来维护次序。
    
    // 不用我们去操心每个ViewController的顺序问题。
    
    return [self.viewControllers objectAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =[self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound||index>=self.viewControllers.count-1) {
        
        return nil;
        
    }
    
    index++;
    
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法，自动来维护次序。
    
    // 不用我们去操心每个ViewController的顺序问题。
    
    return [self.viewControllers objectAtIndex:index];
}

#pragma  UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    UIViewController *viewController = pageViewController.viewControllers[0];
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    [self.segmentedControl setSelectedSegmentIndex:index animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - EGFBasicTableViewDelegate



#pragma mark  -  DAAutoTracker

-(NSDictionary *)getTrackProperties {
    return @{kWindowKey:kWindowHomePage};
}
@end
