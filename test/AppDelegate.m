//
//  AppDelegate.m
//  test
//
//  Created by niuy on 16/11/3.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"
#import "STCalendarViewController.h"
#import "TotalViewController.h"
#import "BlockViewController.h"
#import "FisterViewController.h"
#import "ScoreRankViewController.h"
#import "RankViewController.h"
#import "CategoryViewController.h"
#import "FenLeiViewController.h"
#import "gifViewController.h"
#import "PaoMaDengViewController.h"
#import "MPMovieViewController.h"
#import "AVMovieViewController.h"
#import "ThirdPartyMovieViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //在程序中添加 UIWindow。这个是我们的程序窗口，我们一个程序的最基本承载界面
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建ViewController对象
    //TotalViewController *view = [[TotalViewController alloc] init];
    //FisterViewController *view = [[FisterViewController alloc] init];
    //gifViewController *view = [[gifViewController alloc] init];
    //PaoMaDengViewController *view = [[PaoMaDengViewController alloc] init];
    
    //MPMovieViewController *view = [[MPMovieViewController alloc] init];
    ThirdPartyMovieViewController *view = [[ThirdPartyMovieViewController alloc] init];
    
    //CategoryViewController *view = [[CategoryViewController alloc] init];
    //FenLeiViewController *view = [[FenLeiViewController alloc] init];
    
    //设置UIwindow的rootViewController为上面的这个ViewController，运行APP，首先进入ViewController界面。  然后再这个ViewController中进行UIView控件的添加。
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
     self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    
    //播放器会话设置
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    if (![[AVAudioSession sharedInstance] setActive:YES error:nil]) {
        NSLog(@"Failed to set up a session");
    }
    //启用远程控制事件接收
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
       return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
