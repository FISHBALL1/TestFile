//
//  TestHMSViewController.m
//  test
//
//  Created by niuy on 17/7/13.
//  Copyright © 2017年 niuy. All rights reserved.
//
#define DeclareWeakSelf __weak typeof(self) weakSelf = self;
#define MainScale       ([UIScreen mainScreen].scale)
#define kWindowKey @"window"
#define kWindowHomePage @"A"

#import "TestHMSViewController.h"
#import "HMSegmentedControl.h"
#import "EGFTestViewController.h"
#import "MarketViewController.h"
#import "RankViewController.h"

@interface TestHMSViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIPageViewController *containerViewController;
@end

@implementation TestHMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    self.viewControllers =[NSArray arrayWithObjects:[MarketViewController new],[RankViewController new],[MarketViewController new],nil];
    
    [self.containerViewController setViewControllers:@[[self.viewControllers firstObject] ]
     
                                           direction:UIPageViewControllerNavigationDirectionForward
     
                                            animated:NO
     
                                          completion:nil];
    self.containerViewController.view.frame = CGRectMake(0, 64+40, ScreenWidth, ScreenHeight-64-40); //ScreenHeight-64-49-40
    [[self view] addSubview:[self.containerViewController view]];
    [self addChildViewController:self.containerViewController];
   // [self setupTopStyle];
    
    
}

- (HMSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"头条",@"发现",@"视频"]];
        _segmentedControl.frame = CGRectMake((ScreenWidth-160)/2, 64, 160, 40);
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentedControl.selectionIndicatorColor = [UIColor redColor]; //下划线颜色
        _segmentedControl.selectionIndicatorHeight = 2.0;
        _segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -5, 0);
        _segmentedControl.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]};
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
/*
- (void)setupTopStyle {
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_logo"]];
    [self.view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(54.0, 18.0));
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(33.0);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_top).offset(64.f);
        make.height.mas_equalTo(1.0/MainScale);
    }];
    
}
*/
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
