//
//  MineViewController.h
//  test
//
//  Created by niuy on 16/11/16.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignatureViewController.h"
#import "modifyNickViewController.h"
#import "selectSexViewController.h"
//继承代理的协议
@interface MineViewController : UIViewController <ViewControllerDelegate,modifyNickViewControllerDelegate,selectSexViewControllerDelegate>

@end


