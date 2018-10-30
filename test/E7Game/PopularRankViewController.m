//
//  PopularRankViewController.m
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "PopularRankViewController.h"
#import "RankCollectionCell.h"
#import "headView.h"

@interface PopularRankViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *scoreRankView;
@property (nonatomic, strong) headView *headView;

@end

@implementation PopularRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scoreRankView];
    
}

- (UICollectionView *)scoreRankView {
    if (!_scoreRankView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _scoreRankView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - SafeTopHeight - 40) collectionViewLayout:layout];
        _scoreRankView.backgroundColor = [UIColor whiteColor];
        _scoreRankView.showsVerticalScrollIndicator = NO;
        [_scoreRankView registerClass:[RankCollectionCell class] forCellWithReuseIdentifier:[RankCollectionCell cellIdentifier]];
        [_scoreRankView registerClass:[headView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rankHeadView_identify];
        [_scoreRankView registerClass:[UICollectionElementKindSectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
        _scoreRankView.delegate = self;
        _scoreRankView.dataSource = self;
    }
    return _scoreRankView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView :(UICollectionView *) collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    RankCollectionCell *cell = [self.scoreRankView dequeueReusableCellWithReuseIdentifier:[RankCollectionCell cellIdentifier] forIndexPath:indexPath];
    cell.rankLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row +4];
    //cell.starScore.hidden = YES;
    cell.starLevel.hidden = YES;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头
        _headView = [_scoreRankView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rankHeadView_identify forIndexPath:indexPath];
        
        _headView.leftStarView.hidden = YES;
        _headView.middleStarView.hidden = YES;
        _headView.rightStarView.hidden = YES;
        
        return _headView;
    }else {
        //尾
        UICollectionReusableView *footView = [_scoreRankView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView" forIndexPath:indexPath];
        
        return footView;
    }
}

#pragma mark - UICollectionViewDelegate
//cell size
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(ScreenWidth, 100);//[RankCollectionCell heightForItemCell]
    
}

//头视图尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(ScreenWidth, 150);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
