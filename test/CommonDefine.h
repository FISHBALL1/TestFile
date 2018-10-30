//
//  CommonDefine.h
//  SuperM
//
//  Created by huangd on 16/7/25.
//  Copyright © 2016年 hanx. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

//DEBUG LOG
#ifdef DEBUG
#define SDEBUGLOG(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define SDEBUGLOG(...)
#endif


#define SiOSGreat(v)        ([[UIDevice currentDevice].systemVersion floatValue] >  v)
#define SiOSGreatOrEqual(v) ([[UIDevice currentDevice].systemVersion floatValue] >= v)

#define ASAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define s_weak_self __weak typeof(self) weakSelf = self;

// RGB Color

#define SMRGBColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define SMRGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define SMHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]
#define SMHexAlphaColor(hexValue, alphaP) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:((float)alphaP)]

#define SMWhiteColor [UIColor whiteColor]
#define SMBlackColor [UIColor blackColor]
#define SMGrayColor [UIColor grayColor]
#define SMDarkGrayColor [UIColor darkGrayColor]
#define SMLightGrayColor [UIColor lightGrayColor]
#define SMRedColor [UIColor redColor]
#define SMGreenColor [UIColor greenColor]
#define SMBlueColor [UIColor blueColor]
#define SMYellowColor [UIColor yellowColor]
#define SMOrangeColor [UIColor orangeColor]
#define SMPurpleColor [UIColor purpleColor]
#define SMBrownColor [UIColor brownColor]
#define SMClearColor [UIColor clearColor]

// Font

#define SMSystemFont(size) [UIFont systemFontOfSize:size]
#define SMSystemBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define ScreenWidth     ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight    ([UIScreen mainScreen].bounds.size.height)
#define mainScale       ([UIScreen mainScreen].scale)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
#define SafeTopHeight (IS_IPHONE_X ? 88 : 64)//导航栏高度
#define SafeBottomHeight (IS_IPHONE_X ? 34 : 0)//底部圆角占用高度
#define SafeTopOriginY (SafeTopHeight-44)
//1125*2436//屏幕尺寸

// Phone Model

#define SM_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define SM_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define SM_IS_IPHONE4 (SM_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define SM_IS_IPHONE5 (SM_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define SM_IS_IPHONE6 (SM_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define SM_IS_IPHONE6PLUS (SM_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)
#define SM_IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

//字符串是否为空
#define IsStringEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""])||([(_ref)isEqualToString:@"(null)"]))

#define SMDeviceType (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 1 : 2

// Date
#define SM_MINUTE 60
#define SM_HOUR (60 * SM_MINUTE)
#define SM_DAY (24 * SM_HOUR)
#define SM_WEEK (7 * SM_DAY)
#define SM_MONTH (30.5 * SM_DAY)
#define SM_YEAR (365 * SM_DAY)

//友盟统计appkey
#define UMAppKey @"57c7a35b67e58ec1ca0001f1"

//登录相关

//微博登录
#define WeiBoAppKey     [ThirdpartyLogin weiboAppKey]
#define WeiBoAppSecret  [ThirdpartyLogin weiBoAppSecret]
#define WeiBoRedirectURI @"https://api.weibo.com/oauth2/default.html"
#define WeiBoLoginNotifyName @"WeiBoLoginNotifyName"

//微信appID & appSecret -- 微信登录使用
#define weChatAppId [ThirdpartyLogin wechatAppId]
#define weChatAppSecret [ThirdpartyLogin wechatAppSecret]
#define WechatLoginNotifyName @"WeChatLoginNotifyName"

//QQ登录相关
#define QQAppId [ThirdpartyLogin tencentAppId]
#define QQAppKey [ThirdpartyLogin tencentAppKey]


#define thirdLoginFauiltNotify @"thirdLoginFauiltNotify"
/*
#define thirdLoginGetUserInfoSuccessNotify @"thirdLoginGetUserInfoSuccessNotify"
#define thirdLoginGetUserInfoFauiltNotify @"thirdLoginGetUserInfoFauiltNotify"
#define LoginOutNotify @"LoginOutNotify"
*/
//#define appModelChangedNotify @"appModelChangedNotify"   //userinfo key:AbcType value:@1主题应用列表，@2应用详情
#define articleModelChangedNotify @"articleModelChangedNotify"

#define kGlobalApplicationStartDate @"GlobalApplicationStartDate"

#define successLoading(s) (^(NSObject *obj) {[[LoadingAnimation shareInstance] showWithComplete:s];})
#define StringFormBool(s) ([NSString stringWithFormat:@"%@", @(s)])
#define StringFormInteger(s) ([NSString stringWithFormat:@"%@", @(s)])


#endif /* CommonDefine_h */
