//
//  RankCollectionCell.h
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "EGFBaseCollectionViewCell.h"
#import "StarLevelView.h"

@interface RankCollectionCell : EGFBaseCollectionViewCell

@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) StarLevelView *starLevel;


@end
