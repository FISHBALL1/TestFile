//
//  CategoryTableViewCell.m
//  test
//
//  Created by niuy on 17/10/19.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "CategoryCollectionCell.h"

@interface CategoryTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *categoryView;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.categoryView];
        [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(200);
        }];
        
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(self.contentView);
        }];
        
    }
    return self;
}


- (UICollectionView *)categoryView {
    if (!_categoryView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _categoryView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.showsVerticalScrollIndicator = NO;
//        [_categoryView registerClass:[CategoryCollectionCell class] forCellWithReuseIdentifier:[CategoryCollectionCell cellIdentifier]];
        [_categoryView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kCategoryCollectionCellIdentifier"];
        _categoryView.delegate = self;
        _categoryView.dataSource = self;
    }
    return _categoryView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 8;
}

- (UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//        CategoryCollectionCell *categoryCell = [self.categoryView dequeueReusableCellWithReuseIdentifier:[CategoryCollectionCell cellIdentifier] forIndexPath:indexPath];
    UICollectionViewCell *cell = [self.categoryView dequeueReusableCellWithReuseIdentifier:@"kCategoryCollectionCellIdentifier" forIndexPath:indexPath];
    
    _iconImage = [[UIImageView alloc] init];
    _iconImage.image = [UIImage imageNamed:@"4"];
    _iconImage.layer.masksToBounds = YES;
    _iconImage.layer.cornerRadius = 25;
    [cell.contentView addSubview:self.iconImage];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(cell.contentView);
        make.width.height.mas_equalTo(50);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.text = @"卡牌游戏";
    [cell.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.iconImage);
        make.top.mas_equalTo(self.iconImage.mas_bottom).mas_offset(5);
    }];
    
    return cell;
}

#pragma mark - UICollectionViewDegelate
- (CGSize)collectionView :(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        return CGSizeMake(50, 74);

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {

        return UIEdgeInsetsMake(15, 15, 0, 15);

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    //行
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    //列
    return 20;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
