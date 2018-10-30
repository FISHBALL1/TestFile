//
//  MoreViewController.h
//  SuperM
//
//  Created by xuanpf on 16/8/1.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "BasePushViewController.h"

@interface MoreViewController : BasePushViewController
-(void)setLoginOut:(void (^)(BOOL success))loginOut;
@end
