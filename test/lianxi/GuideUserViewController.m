//
//  GuideUserViewController.m
//  test
//
//  Created by niuy on 17/7/26.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "GuideUserViewController.h"

@interface GuideUserViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation GuideUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.button];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(ScreenWidth, ScreenHeight);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"plateID"];
        _collectionView.pagingEnabled = YES;  //打开分页效果
        _collectionView.showsHorizontalScrollIndicator = NO;   //隐藏水平导航条
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;    //禁止弹簧效果
        
    }
    return _collectionView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 80, 80)];
        [_button setTitle:@"立即启动" forState:UIControlStateNormal];
    }
    return _button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"plateID" forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%zd",indexPath.item]];
    [cell.contentView addSubview:imageView];
    
    [self setIndexPath:indexPath count:4];
    return cell;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger) count {
    if (indexPath.item == count-1) {
        _button.hidden = NO;
    }else {
        _button.hidden = YES;
    }
}
@end
