//
//  MineButton.m
//  SuperM
//
//  Created by hanx on 16/7/28.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "MineButton.h"
#import "CommonDefine.h"

@interface MineButton()

@property (nonatomic,strong) UIImageView *buttonIcon;
@property (nonatomic,strong) UILabel *buttonTitle;
@property (nonatomic,strong) UIImageView *arrowImage;

@end

@implementation MineButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.buttonIcon = [[UIImageView alloc]init];
        [self addSubview:self.buttonIcon];
        [self.buttonIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(20);
            make.height.width.equalTo(@24);
            make.centerY.mas_equalTo(self);
        }];
        
        self.buttonTitle = [[UILabel alloc]init];
        self.buttonTitle.font = SMSystemFont(16);
       
        [self addSubview:self.buttonTitle];
        
        [self.buttonTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@18);
            make.left.mas_equalTo(self.buttonIcon.mas_right).offset(15);
            make.centerY.mas_equalTo(self);
            make.width.equalTo(@200);
        }];
        
        
        self.arrowImage = [[UIImageView alloc]init];
        self.arrowImage.image = [UIImage imageNamed:@"rightArrow"];
        [self addSubview:self.arrowImage];
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(-20);
            make.height.equalTo(@12);
            make.width.equalTo(@6);
            make.centerY.mas_equalTo(self);
        }];
        
    }
    return self;
}

-(void)setButtonIcom:(UIImage *)image andButtonTitle:(NSString *)title{
    self.buttonIcon.image = image;
    self.buttonTitle.text = title;
}


@end
