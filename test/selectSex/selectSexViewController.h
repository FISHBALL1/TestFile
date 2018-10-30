//
//  selectSexViewController.h
//  test
//
//  Created by niuy on 16/11/18.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectSexViewControllerDelegate <NSObject>
- (void) selectMan: (NSString *) man;
@end


@interface selectSexViewController : UIViewController
@property (nonatomic, strong)id <selectSexViewControllerDelegate> delegate;
@end
