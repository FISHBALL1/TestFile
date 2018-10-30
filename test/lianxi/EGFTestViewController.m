//
//  EGFTestViewController.m
//  test
//
//  Created by niuy on 17/7/10.
//  Copyright © 2017年 niuy. All rights reserved.
//
#import "EGFTestViewController.h"

@interface EGFTestViewController () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation EGFTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"E起玩";
    [self tableView];
    NSLog(@"wode%f",ScreenWidth);
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -30, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.sectionHeaderHeight = 1;  //section之间的间距
        _tableView.sectionFooterHeight = 1;
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark tableViewDateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"lolCellIdenti";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else{//删除cell的所有子视图，避免cell重用错乱
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    NSArray *title = @[@"App Store游戏TOP1",@"App Store游戏TOP2",@"App Store游戏TOP3",@"App Store游戏TOP4",@"App Store游戏TOP5",@"App Store游戏TOP6",@"App Store游戏TOP7",@"App Store游戏TOP8"];
    for (int i = 0; i < title.count; i++) {
        if (indexPath.section == i) {
            //UILabel
            UILabel *titleLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 150, 30)];
            titleLabel3.text = title[i];
            titleLabel3.font = [UIFont boldSystemFontOfSize:14];
            titleLabel3.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:titleLabel3];
            
            //ScrollView
            _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, titleLabel3.bottom+5, ScreenWidth, 100)];
            _scrollView.delegate = self;
            _scrollView.contentSize = CGSizeMake(ScreenWidth+420, 0);  //宽度设大可以水平滑动，高度设为0是禁止上下滑动  //(ScreenWidth+420, 0) ipad(2) 宽度768
            _scrollView.showsHorizontalScrollIndicator = NO;  //取消水平滑动指示器
            [cell.contentView addSubview:_scrollView];
            
            //UIImageView
            for (int j = 0; j < 7; j++) {
                _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(j*80+j*100+10, 10, 80, 80)];
                NSString *imageName = [NSString stringWithFormat:@"%i.jpeg",j];
                _imageView.image = [UIImage imageNamed:imageName];
                [_scrollView addSubview:_imageView];
            }
        }
        
}
    return cell;
}

#pragma mark tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
