//
//  MoreButton.m
//  SuperM
//
//  Created by xuanpf on 16/8/1.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "MoreButton.h"

@interface MoreButton ()

@property (nonatomic, strong) UILabel *btnTitleLabel;
@property (nonatomic, strong) UIView *bottomLineView;


@end

@implementation MoreButton


- (void)setTitle:(NSString *)title{
    self.btnTitleLabel = [[UILabel alloc] init];
    self.btnTitleLabel.font = [UIFont systemFontOfSize:15];
    self.btnTitleLabel.textColor = SMHexColor(0x272b3c);
    [self addSubview:self.btnTitleLabel];
    [self.btnTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.bottom.equalTo(self);
        make.right.equalTo(self).offset(-21);
    }];
    
    self.btnImageView = [[UIImageView alloc] init];
    self.btnImageView.image = [UIImage imageNamed:@"rightArrow"];
    [self addSubview:self.btnImageView];
    [self.btnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(6);
        make.centerY.equalTo(self);
    }];
    
    self.btnTitleLabel.text = title;
}

- (void)setIsNeedBottomLine:(BOOL)isNeedBottomLine{
    if (isNeedBottomLine) {
        self.bottomLineView = [[UIView alloc] init];
        self.bottomLineView.backgroundColor = SMHexColor(0xe8e8e8);
        [self addSubview:self.bottomLineView];
        [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.height.mas_equalTo(1.0/mainScale);
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
    }
}

@end
