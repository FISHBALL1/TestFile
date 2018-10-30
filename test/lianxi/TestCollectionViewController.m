//
//  TestCollectionViewController.m
//  test
//
//  Created by niuy on 17/7/18.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "TestCollectionViewController.h"

@interface TestCollectionViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UICollerctionView Demo";
    [self.view addSubview:self.collectionView];
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];  //自动网格布局/自动流式布局
        layout.scrollDirection = UICollectionViewScrollDirectionVertical; //滚动方向设为垂直滚动
        layout.itemSize = CGSizeMake(100, 100);  //设置UICollectionView每个cell的尺寸
        layout.minimumLineSpacing = 50;  //行间距
        layout.minimumInteritemSpacing = 50;  //列间距
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);    //边距
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"plateID"]; //cell重用ID注册
        _collectionView.showsHorizontalScrollIndicator = NO; //隐藏水平滚动条
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //_collectionView.bounces = NO;    //禁止弹簧效果
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UICollectionViewDataSource
//总共多少组Section    默认为1个Section
/*
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
*/
//每组Section有多少cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

#pragma mark UIConllectionViewDelegate
//每个cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"plateID" forIndexPath:indexPath];            //从可重用的单元格队列中取出一个单元格
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, 80)];
    imageView.image = [UIImage imageNamed:@"4"];
    [cell.contentView addSubview:imageView];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    return NSLog(@"点击了第 %zd组 第%zd个", indexPath.section, indexPath.item);
}

@end


