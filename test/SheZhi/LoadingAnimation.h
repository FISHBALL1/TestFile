//
//  LoadingAnimation.h
//  SuperM
//
//  Created by xuanpf on 16/10/19.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingAnimation : UIImageView

+ (LoadingAnimation *)shareInstance;

- (void)show;

- (void)showWithComplete:(NSString*)finishStr;

- (void)dismiss;

- (void)dismissWithError:(NSString*)err;

@end

@interface LoadingFail : UIImageView

+(LoadingFail *)shareInstance;

-(void)showWithError:(NSString*)err;

-(void)dismiss;

@end

@interface LoadingComplete : UILabel

+(LoadingComplete *)shareInstance;

-(void)showWithComplete:(NSString*)finishStr;

-(void)dismiss;

@end