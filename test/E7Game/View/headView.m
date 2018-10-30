//
//  headView.m
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "headView.h"
#import "StarLevelView.h"


@interface headView()

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *middleBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *middleLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation headView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        _headView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headView];
        
        
        //Btn
        _leftBtn = [[UIButton alloc] init];
        _leftBtn.layer.masksToBounds = YES;
        _leftBtn.layer.cornerRadius = 10;
        [_leftBtn setImage:[UIImage imageNamed:@"0"] forState:UIControlStateNormal];
        [self addSubview:self.leftBtn];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(60);
        }];
        
        _middleBtn = [[UIButton alloc] init];
        _middleBtn.layer.masksToBounds = YES;
        _middleBtn.layer.cornerRadius = 10;
        [_middleBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [self addSubview:self.middleBtn];
        [self.middleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftBtn.mas_right).mas_offset((ScreenWidth - 3*60 -2*30)/2);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(60);
        }];
        
        _rightBtn = [[UIButton alloc] init];
        _rightBtn.layer.masksToBounds = YES;
        _rightBtn.layer.cornerRadius = 10;
        [_rightBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [self addSubview:self.rightBtn];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.middleBtn.mas_right).mas_offset((ScreenWidth - 3*60 -2*30)/2);
            make.right.mas_equalTo(-30);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(60);
        }];
        
        //Label
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.text = @"地球最后之日";
        _leftLabel.numberOfLines = 2;
        _leftLabel.font = [UIFont systemFontOfSize:11];
        CGFloat size = [_leftLabel.text sizeWithAttributes:@{NSFontAttributeName:_leftLabel.font}].width;
        if (size < 60) {
            _leftLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.leftBtn);
            make.top.mas_equalTo(self.leftBtn.mas_bottom).mas_equalTo(10);
        }];
        
        _middleLabel = [[UILabel alloc] init];
        _middleLabel.textColor = [UIColor blackColor];
        _middleLabel.text = @"王者荣耀";
        _middleLabel.numberOfLines = 2;
        _middleLabel.font = [UIFont systemFontOfSize:11];
        CGFloat width = [_middleLabel.text sizeWithAttributes:@{NSFontAttributeName:_middleLabel.font}].width;
        if (width < 60) {
            _middleLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self addSubview:self.middleLabel];
        [self.middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.middleBtn);
            make.top.mas_equalTo(self.middleBtn.mas_bottom).mas_equalTo(10);
        }];
        
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textColor = [UIColor blackColor];
        _rightLabel.text = @"迷你DAYZ";
        _rightLabel.numberOfLines = 2;
        _rightLabel.font = [UIFont systemFontOfSize:11];
        CGFloat sizeWidth = [_rightLabel.text sizeWithAttributes:@{NSFontAttributeName:_rightLabel.font}].width;
        if (sizeWidth < 60) {
            _rightLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.rightBtn);
            make.top.mas_equalTo(self.rightBtn.mas_bottom).mas_equalTo(10);
        }];
        
        //Star
        _leftStarView = [StarLevelView new];
        _leftStarView.starCount = 5;
        _leftStarView.margin = 2;
        _leftStarView.level = 1; //星级
        _leftStarView.starSize = CGSizeMake(10, 10);
        [self addSubview:_leftStarView];
        [_leftStarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftBtn);
            make.top.mas_equalTo(self.leftLabel.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(40);
        }];
        
        _middleStarView = [StarLevelView new];
        _middleStarView.starCount = 5;
        _middleStarView.margin = 2;
        _middleStarView.level = 7; //星级
        _middleStarView.starSize = CGSizeMake(10, 10);
        [self addSubview:_middleStarView];
        [_middleStarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.middleBtn);
            make.top.mas_equalTo(self.leftStarView);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(40);
        }];
        
        _rightStarView = [StarLevelView new];
        _rightStarView.starCount = 5;
        _rightStarView.margin = 2;
        _rightStarView.level = 8; //星级
        _rightStarView.starSize = CGSizeMake(10, 10);
        [self addSubview:_rightStarView];
        [_rightStarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.rightBtn);
            make.top.mas_equalTo(self.leftStarView);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(40);
        }];
        
        //关注度
        _attentionLeftLabel = [[UILabel alloc] init];
        _attentionLeftLabel.textColor = [UIColor blackColor];
        _attentionLeftLabel.font = [UIFont systemFontOfSize:8];
        _attentionLeftLabel.text = @"关注度：555人";
        [self addSubview:self.attentionLeftLabel];
        [self.attentionLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.leftBtn);
            make.top.mas_equalTo(self.leftLabel.mas_bottom).mas_offset(5);
        }];
        
        _attentionMiddleLabel = [[UILabel alloc] init];
        _attentionMiddleLabel.textColor = [UIColor blackColor];
        _attentionMiddleLabel.font = [UIFont systemFontOfSize:8];
        _attentionMiddleLabel.text = @"关注度：555人";
        [self addSubview:self.attentionMiddleLabel];
        [self.attentionMiddleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.middleBtn);
            make.top.mas_equalTo(self.attentionLeftLabel);
        }];
        
        _attentionRightLabel = [[UILabel alloc] init];
        _attentionRightLabel.textColor = [UIColor blackColor];
        _attentionRightLabel.font = [UIFont systemFontOfSize:8];
        _attentionRightLabel.text = @"关注度：555人";
        [self addSubview:self.attentionRightLabel];
        [self.attentionRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.rightBtn);
            make.top.mas_equalTo(self.attentionLeftLabel);
        }];
        
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor blackColor];
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(1);
        }];
         
    }
    return self;
}

+ (CGFloat)heightForItemCell {
    return 150;
}
@end
