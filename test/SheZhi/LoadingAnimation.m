//
//  LoadingAnimation.m
//  SuperM
//
//  Created by xuanpf on 16/10/19.
//  Copyright © 2016年 hanx. All rights reserved.
//

#import "LoadingAnimation.h"

static LoadingFail* obj;
static LoadingComplete* completeObj;

static NSString *kLoadingBlue = @"loading_blue";

static LoadingAnimation* sharedObj;
@interface LoadingAnimation (){
    BOOL _shwo;
    UIImageView* _imgView;
}

@end

@implementation LoadingAnimation

- (id)initWithFrame:(CGRect)frame {
    if (CGRectEqualToRect(frame, CGRectZero)) {
        frame = CGRectMake(ScreenWidth/2-45/2, ScreenHeight/2-45/2, 45, 45);
    } else {
        frame = CGRectMake(CGRectGetWidth(frame)/2-45/2, CGRectGetHeight(frame)/2-45/2, 45, 45);
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = SMClearColor;
        [self initialImageViewWithImage:kLoadingBlue];
    }
    return self;
}

- (void)initialImageViewWithImage:(NSString *)image {
    static NSInteger kMaxImageCount = 24;
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    NSMutableArray* ary = [NSMutableArray array];
    for (int i =0; i<kMaxImageCount; i++) {
        NSString* str;
        if (i<10) {
            str = [NSString stringWithFormat:@"%@_0000%d", image, i];
        }else{
            str = [NSString stringWithFormat:@"%@_000%d", image ,i];
        }
        UIImage *objImage =[UIImage imageNamed:str];
        if (!objImage) {
        }else{
            [ary addObject:objImage];
        }
    }
    [_imgView setAnimationImages:ary];
    [_imgView setAnimationDuration:1.0];
    [_imgView startAnimating];
    [self addSubview:_imgView];
}

+(LoadingAnimation*)shareInstance{
    @synchronized (self)
    {
        if (sharedObj == nil)
        {
            if (sharedObj == nil)
                sharedObj = [[self alloc] initWithFrame:CGRectZero];
        }
    }
    return sharedObj;
    
}

-(void)show{
    if (_shwo) {
        [self dismiss];
    }
    _shwo = YES;
    [ASAppDelegate.window addSubview:self];
    [_imgView startAnimating];
    
}

-(void)showWithComplete:(NSString*)finishStr{
    [self dismiss];
    [[LoadingComplete shareInstance] showWithComplete:finishStr];
    
}

-(void)dismiss{
    if (!_shwo) {
        return;
    }
    _shwo = NO;
    [_imgView stopAnimating];
    [self removeFromSuperview];
}

-(void)dismissWithError:(NSString*)err{
    [self dismiss];
    [[LoadingFail shareInstance] showWithError:err];
}

-(void)stop{
    [self.layer removeAllAnimations];
}

@end

@interface LoadingFail (){
    BOOL _shwo;
    UILabel* lab;
}

@end

@implementation LoadingFail

- (id)initWithFrame:(CGRect)frame {
    
    frame = CGRectMake(ScreenWidth/2 - 150.0/2, ScreenHeight/2 - 50/2, 150.0, 50.0);
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = SMHexAlphaColor(0x222222, 0.9);
        self.layer.cornerRadius = 9.0f;
        self.layer.masksToBounds = YES;
        
        lab = [[UILabel alloc] init];
        lab.backgroundColor = SMClearColor;
        lab.textColor = SMHexColor(0xFFFFFF);
        lab.font = SMSystemFont(14);
        lab.textAlignment = NSTextAlignmentCenter;
        lab.numberOfLines= 0;
        lab.tag= 101;
        [self addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(20.0f);
            make.right.equalTo(self).with.offset(-20.0f);
            make.centerY.equalTo(self);
        }];
    }
    
    return self;
}

+ (LoadingFail*)shareInstance {
    @synchronized (self) {
        if (obj == nil) {
            if (obj == nil)
                obj = [[self alloc] initWithFrame:CGRectZero];
        }
    }
    return obj;
}

-(void)showWithError:(NSString*)err {
    if (_shwo) {
        [self dismiss];
    }
    if (err) {
        lab.text = err;
    }else{
        lab.text = NSLocalizedString(@"网络异常", nil);
    }
    
    CGSize size = [err sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:NSFontAttributeName, SMSystemFont(14), nil]];
    if (size.width > 110.0) {
        self.frame = CGRectMake(ScreenWidth/2 - 150.0/2, ScreenHeight/2 - 65.0/2, 150.0, 65.0);
    }
    
    _shwo = YES;
    [ASAppDelegate.window addSubview:self] ;
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:1.1];
}

- (void)dismiss {
    if (!_shwo) {
        return;
    }
    _shwo = NO;
    [self removeFromSuperview];
}

@end

@interface LoadingComplete (){
    BOOL _shwo;
}

@end


@implementation LoadingComplete

- (id)initWithFrame:(CGRect)frame {
    
    frame = CGRectMake(ScreenWidth/2 - 150.0/2, ScreenHeight/2 - 50/2, 150.0, 50.0);
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = SMHexAlphaColor(0x222222, 0.9);
        self.layer.cornerRadius = 9.0f;
        self.layer.masksToBounds = YES;
        
        self.textColor = SMHexColor(0xFFFFFF);
        self.font = SMSystemFont(14);
        self.textAlignment = NSTextAlignmentCenter;
        self.numberOfLines= 0;
    }
    
    return self;
}

+ (LoadingComplete*)shareInstance {
    @synchronized (self) {
        if (completeObj == nil) {
            if (completeObj == nil)
                completeObj = [[self alloc] initWithFrame:CGRectZero];
        }
    }
    return completeObj;
}

- (void)showWithComplete:(NSString*)finishStr {
    if (_shwo) {
        [self dismiss];
    }
    if (finishStr) {
        self.text = finishStr;
    } else {
        self.text = NSLocalizedString(@"操作完成", nil);
    }
    
    CGSize size = [finishStr sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:NSFontAttributeName, SMSystemFont(14), nil]];
    if (size.width > 110.0) {
        self.frame = CGRectMake(ScreenWidth/2 - 150.0/2, ScreenHeight/2 - 65.0/2, 150.0, 65.0);
    }
    
    _shwo = YES;
    [ASAppDelegate.window addSubview:self] ;
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:1.1];
}

- (void)dismiss {
    if (!_shwo) {
        return;
    }
    _shwo = NO;
    [self removeFromSuperview];
}

@end