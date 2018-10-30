//
//  ChosenTableViewCell.m
//  test
//
//  Created by niuy on 17/10/19.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "ChosenTableViewCell.h"
#import "ChosenCollectionCell.h"

@interface ChosenTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *chosenView;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *chosenImage;

@end

@implementation ChosenTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"小编精选";
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(5);
            make.height.mas_equalTo(20);
        }];
        
//        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
//        [self.contentView addSubview:self.moreBtn];
//        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.contentView).mas_offset(-15);

//            
//        }];
        
        [self.contentView addSubview:self.chosenView];
        [self.chosenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);  //5
            make.left.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(70);
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


- (UICollectionView *)chosenView {
    if (!_chosenView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _chosenView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _chosenView.backgroundColor = [UIColor whiteColor];
        _chosenView.showsVerticalScrollIndicator = NO;
//        [_chosenView registerClass:[ChosenCollectionCell class] forCellWithReuseIdentifier:[ChosenCollectionCell cellIdentifier]];
        [_chosenView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kChoseCellIdenfite"];
        _chosenView.delegate = self;
        _chosenView.dataSource = self;
    }
    return _chosenView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    ChosenCollectionCell *categoryCell = [self.chosenView dequeueReusableCellWithReuseIdentifier:[ChosenCollectionCell cellIdentifier] forIndexPath:indexPath];
    UICollectionViewCell *cell = [self.chosenView dequeueReusableCellWithReuseIdentifier:@"kChoseCellIdenfite" forIndexPath:indexPath];
    
    _chosenImage = [[UIImageView alloc] init];
    _chosenImage.image = [UIImage imageNamed:@"image1"];
    [cell.contentView addSubview:self.chosenImage];
    [self.chosenImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(cell.contentView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
        
    }];
    
    //return categoryCell;
    return cell;
}

#pragma mark - UICollectionViewDegelate
- (CGSize)collectionView :(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 60);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 15, 10, 15);

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    //列
    return 15;
    
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
