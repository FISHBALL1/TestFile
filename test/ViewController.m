//
//  ViewController.m
//  test
//
//  Created by niuy on 16/11/3.
//  Copyright © 2016年 niuy. All rights reserved.
//
#import "ViewController.h"
#import <JSONModel/JSONModel.h>
#import "AFNetworking.h"//主要用于网络请求方法
#import "UserModel.h"
#include <ImageIO/ImageIOBase.h>
#include <sys/utsname.h>

#import "niuyaoViewController.h"
@interface ViewController () <UIScrollViewDelegate>
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSMutableArray* Labels;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic,strong) NSDictionary *NIU;

@property (nonatomic,strong) NSString *labelText;
@property (nonatomic, strong) UIButton *select;
@property (nonatomic,strong) UIDatePicker *picker;
@property (nonatomic,strong) NSObject *Person;

@property (nonatomic, strong)UIImageView *imageView;
//@property (nonatomic, readonly) BOOL isAnimating;
@property(nonatomic,assign) BOOL isAnimating;

@property (nonatomic, strong) NSString *deviceString;
@property (nonatomic, strong) UILabel *lable;
@end

@implementation ViewController
/*
-(BOOL) isAnimating{
    
    
    return YES;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"address":@"浙大紫金港",
                           @"age" : @"20",
                           @"scores":@{@"english":@"99",@"chinese":@"133"},
                           @"scoreArray":@[@{@"english":@"99",@"chinese":@"133"},
                                           @{@"english":@"98",@"chinese":@"134"},
                                           @{@"english":@"97",@"chinese":@"135"}]
                           };
    NSLog(@"%@",dict);
     */
    /*
    UserModel *model = [[UserModel alloc] initWithDictionary:dict error:nil];
    NSLog(@"%@",model.name);// 正常的 字典
    NSLog(@"%@",model.scores);// 嵌套 model
    NSLog(@"%@",model.scoreArray[0]);// 嵌套 model数组
    
    */
       //设置VIEW的背景色；
    self.view.backgroundColor = [UIColor whiteColor];
    [self Model];
    //
    //_deviceName = [[UIDevice currentDevice] model];
    
    [self platform];
    //[self UI];
    
    //创建UIImageView，添加到界面
    UIImageView *imageView = [[UIImageView alloc]   initWithFrame:CGRectMake(20, 120, 100, 100)];
    [self.view addSubview:imageView];
    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=0; i<24; i++) {
        UIImage *image = [UIImage imageNamed:[NSString  stringWithFormat:@"loading_blue_000%d.png",i]];  //loading_blue_00000
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 23*0.05;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
    [imageView startAnimating];
    //停止播放动画  - (void)stopAnimating;
    //判断是否正在执行动画  - (BOOL)isAnimating;
    //[imageView stopAnimating];
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageView.animationDuration + 0.5f];
    /*
    if (!_isAnimating) {
        [imageView stopAnimating];
        NSLog(@"WOSHINIUYAO");
    }
    */
}

- (NSString *)platform{
    struct utsname systemInfo;
    uname(&systemInfo);
    _deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    [self UI];
    //未考虑iPhone3等较老设备，未考虑iPad设备（公司的应用不支持iPad）
    //iphone
    /*
    if ([deviceString hasPrefix:@"iPhone3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]||[deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]||[deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString hasPrefix:@"iPhone6"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    //如果没有匹配直接返回系统提供的类似@"iPhone5,3"这种型号
    */
    //iPad 系列
    
    if ([_deviceString isEqualToString:@"iPad3,1"]) {
        [self UI];
        //return @"iPad 3 (WiFi)";
        return _lable.text = @"iPad 3 (WiFi)";
    }else{
       // [self UI];
    }
    
    
    /*
    if ([_deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([_deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([_deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([_deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([_deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([_deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([_deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([_deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([_deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([_deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([_deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([_deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    */
    
    NSLog(@"niuyaode%@",_deviceString);
    return _deviceString;
}

- (void)Model{
    /*
   //1.3.4 GET AFHTTPClient
    AFHTTPClient * client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://v.juhe.cn/sweizhang/citys?key=ed0bc9d30bec86439cb82def4b90e918"]];
    //创建一个可变字典
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
    [parametersDic setObject:@"ed0bc9d30bec86439cb82def4b90e918" forKey:@"key"];
   
     NSURLRequest * request = [client requestWithMethod:@"GET"
                                                  path:nil
                                            parameters:parametersDic];
                                                
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
        
        NSLog(@"json == %@",JSON); //responseObject
        
       // UserModel *model = [[UserModel alloc] initWithDictionary:parametersDic error:nil];
       // NSLog(@"niuyao%@",model.resultcode);// 正常的 字典
       // NSLog(@"%@",model.result.sk.wind_direction);
       // NSLog(@"%@",model.result.future[0]);// 嵌套 model数组
       // _labelText = model.resultcode;
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {
        
        NSLog(@"faild -- ");
    }];
    
    [operation start];
    */
    
    /*
    NSURL *URL = [NSURL URLWithString:@"http://www.quanmin.tv/json/page/ios-index/info.json?0303104250"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        UserModel *model = [[UserModel alloc] initWithDictionary:responseObject error:nil];
     
        //NSLog(@"%@", responseObject);

      //  NSLog(@"%@",model.result[0]);
        NSLog(@"%@",((scoreModel *)model.result[0]).province);
        NSLog(@"%@",((scoreModel *)model.result[0]).citys[0]);
        NSLog(@"niu%@",((ThreeModel*)((scoreModel *)model.result[0]).citys[0]).city_name);
        
       // NSLog(@"yao%@",model.shouyelunbo[0]); //(scoreModel *)model.shouyelunbo[0]
       // NSLog(@"niu%@",((scoreModel *)model.shouyelunbo[0]).nick);
       // NSLog(@"niu%@",model.object[0]);
        NSLog(@"niu%@",((scoreModel *)model.object[0]).nick); //全民超人小智
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    */
    
  /*
   // 2。发一个post请求       链接有问题，找一个POST链接
   // AFHTTPClient *aClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://v.juhe.cn/weather"]];
    //http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6
    //创建一个可变字典
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
   // [parametersDic setObject:@"2&" forKey:@"format"];
    [parametersDic setObject:@"苏州" forKey:@"index?cityname"];
    [parametersDic setObject:@"d162fbd409bfff09e7f2aca6a3948dd6" forKey:@"key"];
    
    AFHTTPClient *bClient = [AFHTTPClient clientWithBaseURL : [NSURL URLWithString:@"http://v.juhe.cn/weather"]];
    
    [bClient postPath:nil parameters:parametersDic success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"response description:%@",[responseObject description]);
     }
             failure:^(AFHTTPRequestOperation *operation,NSError *error)
     {
         NSLog(@"error description:%@",[error description]);
     }];
*/
    /*
    //http://wxt.xiaocool.net/index.php?g=apps&m=school&a=SetComment&userid=605&id=42&content=jkjkjk&type=4
    //1.3.4 POST传输
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://wxt.xiaocool.net/index.php?g=apps&m=school&a=SetComment"]];
    //创建一个可变字典
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
    [parametersDic setObject:@"42" forKey:@"id"];
    [parametersDic setObject:@"605" forKey:@"userid"];
    [parametersDic setObject:@"niuyao" forKey:@"content"];
    [parametersDic setObject:@"type" forKey:@"4"];
    NSURLRequest *request = [client requestWithMethod:@"POST"
                                                  //path:@""
                                                 path:nil
                                            parameters:parametersDic];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
        NSLog(@"json == %@",JSON);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {
        
        NSLog(@"faild -- ");
    }];
   
    [operation start];
    
    */
    //http://112.74.104.139/xiaoniutv/user/updateUser
    //AFN3.0.4 POST请求
    NSURL *URL = [NSURL URLWithString:@"http://112.74.104.139/xiaoniutv/user/updateUser"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //假如需要提交给服务器的参数是key＝1,class_id=100
    //创建一个可变字典
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
    [parametersDic setObject:@"15552293205" forKey:@"mobile"];
    [parametersDic setObject:@"河流" forKey:@"nickname"];

    //以post的形式提交，POST的参数就是上面的域名，parameters的参数是一个字典类型，将上面的字典作为它的参数
    [manager POST:URL.absoluteString parameters:parametersDic success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
       // [self UI];
        NSLog(@"登陆成功");
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"登录失败");
    }];
  

}


- (void)UI{
    
    //设置label控件的位置
    _lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 150, 50)];
    _lable.backgroundColor = [UIColor blueColor];
    //label文字居中
    _lable.textAlignment = UITextAlignmentCenter;
    //lable.text = _labelText;
    //_lable.text = _deviceString;
    _lable.textColor = [UIColor redColor];
    
    //把label控件添加到当前的view上
    [self.view addSubview:_lable];
    
    //设置text
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    textField.text = _labelText;
    // [textField setText:_labelText];
    NSLog(@"niuyao:%@",textField.text);
    [textField setTextColor:[UIColor blackColor]];
    [self.view addSubview:textField];
    
    //设置textFiledView
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(50, 150, 150, 50)];
    [textview setText:@"魏凯源"];
    [self.view  addSubview:textview];
    
    //设置button
    _button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 120, 20)];
    _button.backgroundColor = [UIColor blueColor];
    [_button setTitle:@"niuyao" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(selectis) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

    
    /*
    _picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 675, 400)];
    _picker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:_picker];
    [self.picker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
  //  NSLog(@"NIUYAO%@",_picker.date);
    
    NSArray *array = [NSArray arrayWithObjects:@"abc",@"def",@"ght",nil];
    NSLog(@"%zi",array.count);

    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"3",@"2", nil];
    NSLog(@"%@",array1);
    [array1 sortUsingSelector:@selector(compare:)];
    NSLog(@"%@",array1);
    
//    NSDictionary *dict = @{
//                           @"name" : @"Jack",
//                           @"address":@"浙大紫金港",
//                           @"age" : @"20",
//                           @"scores":@{@"english":@"99",@"chinese":@"133"},
//                           @"scoreArray":@[@{@"english":@"99",@"chinese":@"133"},
//                                           @{@"english":@"98",@"chinese":@"134"},
//                                           @{@"english":@"97",@"chinese":@"135"}]
//                           };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name" , @"Jack",
                                 @"address",@"浙大紫金港",
                                 @"age" , @"20",
                                 @"scores",@{@"english":@"99",@"chinese":@"133"},
                                 @"scoreArray",@[@{@"english":@"99",@"chinese":@"133"},
                                                 @{@"english":@"98",@"chinese":@"134"},
                                                 @{@"english":@"97",@"chinese":@"135"}], nil];
  //  NSLog(@"%@",dict);
  //  NSLog(@"%@",[dict allKeys]);
    for (id key in dict) {
        NSLog(@"%@=%@",key,[dict objectForKey:key]);
    }
    [dict setValue:@"niu" forKey:@"name"];
    [dict removeObjectForKey:@"name"];
  //  [dict removeObjectForkey:@"age"];
    NSLog(@"%@",dict);
    
    */
    
    
    
}


- (void)selectis{
    niuyaoViewController *niuyao = [[niuyaoViewController alloc] init];
    [self.navigationController pushViewController:niuyao animated:YES];

}
/*
- (UIButton *) select{
    NSLog(@"NIUYAO%@",_picker.date);
    return _select;
}

- (void)dateChanged:(id)send{
//    UIDatePicker *control = (UIDatePicker *)sender;
    NSDate* date = _picker.date;
    NSLog(@"%@",date);
}

 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
