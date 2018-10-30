//
//  ChosenCollectionCell.m
//  test
//
//  Created by niuy on 17/10/19.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "ChosenCollectionCell.h"

@interface ChosenCollectionCell()

@property (nonatomic, strong) UIImageView *chosenImage;

@end

@implementation ChosenCollectionCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _chosenImage = [[UIImageView alloc] init];
        _chosenImage.image = [UIImage imageNamed:@"image1"];
        [self.contentView addSubview:self.chosenImage];
        [self.chosenImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self.contentView);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(60);
            
        }];
        
    }
    return self;
}

@end
