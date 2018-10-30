//
//  headView.h
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "StarLevelView.h"

static NSString *rankHeadView_identify = @"identify_rankHeadView";

@interface headView : UICollectionReusableView

@property (nonatomic, strong) UILabel *attentionLeftLabel;
@property (nonatomic, strong) UILabel *attentionMiddleLabel;
@property (nonatomic, strong) UILabel *attentionRightLabel;

@property (nonatomic, strong) StarLevelView *leftStarView;
@property (nonatomic, strong) StarLevelView *middleStarView;
@property (nonatomic, strong) StarLevelView *rightStarView;



@end
