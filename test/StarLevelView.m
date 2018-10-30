//
//  StarLevelView.m
//  STVideo
//
//  Created by niuy on 2017/8/11.
//  Copyright © 2017年 zhangliang. All rights reserved.
//

#import "StarLevelView.h"

@implementation StarLevelView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)setStarCount:(NSInteger)starCount {
    _starCount = starCount;
    if (self.subviews.count) {
        [self removeAllSubviews];
    }
    for (NSInteger i = 0; i < starCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
    }
}

- (void)setMargin:(CGFloat)margin {
    _margin = margin;
    
}

- (void)setStarSize:(CGSize)starSize {
    _starSize = starSize;
    CGFloat _width = starSize.width;
    CGFloat _height = starSize.height;
    
    CGFloat _selfleft = self.frame.origin.x;
    CGFloat _selftop = self.frame.origin.y;
    CGFloat _selfW = _width*self.starCount + self.margin*(self.starCount-1);
    self.frame = CGRectMake(_selfleft, _selftop, _selfW, _height);
    
    // 子视图位置
    NSArray<UIImageView *> *subViews = self.subviews;
    for (NSInteger i = 0; i < self.starCount; i++) {
        UIImageView *imageView = subViews[i];
        CGFloat _starleft = i*(_width + self.margin);
        imageView.frame = CGRectMake(_starleft, 0, _width, _height);
    }
}

- (void)setLevel:(NSInteger)level {
    _level = level;
    
    NSInteger lightStarCount = level/2-1;
    if ((level%2) == 1) {
        lightStarCount += level%2;
    }
    
    NSArray<UIImageView *> *subImageViews = self.subviews;
    [subImageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (lightStarCount == -1) {
            obj.image = [UIImage imageNamed:@"star_gray"];
        } else {
            if (idx <= lightStarCount) {
                if (level%2 == 1 && idx == lightStarCount) {
                    obj.image = [UIImage imageNamed:@"star_half"];
                } else {
                    obj.image = [UIImage imageNamed:@"star_linght"];
                }
            } else {
                obj.image = [UIImage imageNamed:@"star_gray"];
            }
        }
    }];
    
}




@end
