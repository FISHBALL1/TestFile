//
//  StarLevelView.h
//  STVideo
//
//  Created by niuy on 2017/8/11.
//  Copyright © 2017年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarLevelView : UIView

// 星级别
@property (nonatomic, assign) NSInteger level;

// 星星间距
@property (nonatomic, assign) CGFloat margin;
// 星星size
@property (nonatomic, assign) CGSize starSize;
// starCount 星星数
@property (nonatomic, assign) NSInteger starCount;


@end
