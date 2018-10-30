//
//  modifyNickViewController.h
//  test
//
//  Created by niuy on 16/11/17.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePushViewController.h"

@protocol modifyNickViewControllerDelegate <NSObject>
-(void) nickText:(NSString *)  nickView;
@end

@interface modifyNickViewController : BasePushViewController
@property (nonatomic, weak)id <modifyNickViewControllerDelegate> delegate;
@end
