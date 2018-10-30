//
//  RankCollectionCell.m
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "RankCollectionCell.h"
@interface RankCollectionCell()

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *Description;

//@property (nonatomic, strong) UIView *bottomLine;


@end


@implementation RankCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _rankLabel = [[UILabel alloc] init];
        _rankLabel.textColor = [UIColor blackColor];
        _rankLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_rankLabel];
        [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(15);
            make.height.mas_equalTo(20);
        }];
        
        _iconImage = [[UIImageView alloc] init];
        _iconImage.image = [UIImage imageNamed:@"3"];
        _iconImage.layer.cornerRadius = 10;
        _iconImage.layer.masksToBounds = YES;
        [self addSubview:self.iconImage];
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.rankLabel.mas_right).mas_offset(15);
            make.centerY.mas_equalTo(self);
            make.height.width.mas_equalTo(60);
            
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"英雄联盟";
        _titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImage.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.iconImage);
            make.height.mas_equalTo(20);
        }];

        _starLevel = [StarLevelView new];
        _starLevel.starCount = 5;
        _starLevel.margin = 2;
        _starLevel.level = 8;
        _starLevel.starSize = CGSizeMake(7, 7);
        [self addSubview:_starLevel];
        [_starLevel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(40);
        }];
        
        _Description = [[UILabel alloc] init];
        _Description.textColor = [UIColor blackColor];
        _Description.numberOfLines = 2;
        _Description.text = @"控制自己，掌控敌人！";
        _Description.font = [UIFont systemFontOfSize:11];
        if (_Description.text.length > 20) {
            _Description.lineBreakMode = NSLineBreakByTruncatingTail;
        }
        [self addSubview:self.Description];
        [self.Description mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.starLevel.mas_bottom).mas_offset(5);
        }];
        
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.textColor = [UIColor blackColor];
        _scoreLabel.font = [UIFont systemFontOfSize:8];
        _scoreLabel.text = @"关注度：555人";
        [self addSubview:self.scoreLabel];
        [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
        }];
        
//        _bottomLine = [[UIView alloc] init];
//        _bottomLine.backgroundColor = [UIColor blackColor];
//        [self addSubview:self.bottomLine];
//        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(self);
//            make.left.right.mas_equalTo(self);
//            make.height.mas_equalTo(1);
//        }];
        
    }
    return self;
}

- (CGFloat)heightForItemCell {
    return 100;
}

@end
