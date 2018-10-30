//
//  CategoryViewController.m
//  test
//
//  Created by niuy on 17/10/18.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryCollectionCell.h"
#import "RankCollectionCell.h"

@interface CategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *categoryView;


@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.categoryView];
    
}

- (UICollectionView *)categoryView {
    if (!_categoryView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _categoryView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.showsVerticalScrollIndicator = NO;
        [_categoryView registerClass:[CategoryCollectionCell class] forCellWithReuseIdentifier:[CategoryCollectionCell cellIdentifier]];
        _categoryView.delegate = self;
        _categoryView.dataSource = self;
    }
    return _categoryView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 8;
    }
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}

- (UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *itemCell = nil;
    if (indexPath.section == 0) {
        CategoryCollectionCell *categoryCell = [self.categoryView dequeueReusableCellWithReuseIdentifier:[CategoryCollectionCell cellIdentifier] forIndexPath:indexPath];
        return categoryCell;
    }
    return itemCell;
    
}

#pragma mark - UICollectionViewDegelate
- (CGSize)collectionView :(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return CGSizeMake(50, 74);
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {

        return UIEdgeInsetsMake(15, 15, 0, 15);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    //行
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    //列
    if (section == 0) {
        return 20;
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
