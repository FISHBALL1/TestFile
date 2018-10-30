//
//  MoreButton.h
//  SuperM
//
//  Created by xuanpf on 16/8/1.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreButton : UIButton

@property (nonatomic, assign) BOOL isNeedBottomLine;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImageView *btnImageView;

@end
