//
//  CategoryCollectionCell.m
//  test
//
//  Created by niuy on 17/10/18.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "CategoryCollectionCell.h"

@interface CategoryCollectionCell()

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation CategoryCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _iconImage = [[UIImageView alloc] init];
        _iconImage.image = [UIImage imageNamed:@"4"];
        _iconImage.layer.masksToBounds = YES;
        _iconImage.layer.cornerRadius = 25;
        [self.contentView addSubview:self.iconImage];
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.contentView);
            make.width.height.mas_equalTo(50);
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"卡牌游戏";
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.iconImage);
            make.top.mas_equalTo(self.iconImage.mas_bottom).mas_offset(5);
        }];
    }
    return self;
}

@end
