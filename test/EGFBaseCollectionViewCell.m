//
//  EGFBaseCollectionViewCell.m
//  test
//
//  Created by niuy on 17/10/17.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "EGFBaseCollectionViewCell.h"

@implementation EGFBaseCollectionViewCell

+ (NSString *)cellIdentifier {
    return [NSString stringWithFormat:@"_cellID_%@",self];
}

+ (CGFloat)heightForItemCell {
    return 0.1;
}

@end
