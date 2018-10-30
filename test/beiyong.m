//
//  beiyong.m
//  test
//
//  Created by niuy on 16/12/8.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <Foundation/Foundation.h>


//GET请求 3.0.4版本
/*
 NSURL *URL = [NSURL URLWithString:@"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6"];
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 [manager GET:URL.absoluteString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
 //网络请求是异步操作，初始化model的时候数据还没请求到，所以请求和解析必须在一起。  model中数据的使用也是这个道理，不能直接给label等赋值，
 UserModel *model = [[UserModel alloc] initWithDictionary:responseObject error:nil];
 NSLog(@"%@",model.resultcode);// 正常的 字典
 NSLog(@"%@",model.result.sk.wind_direction);
 NSLog(@"%@",model.result.future[0]);// 嵌套 model数组
 _labelText = model.resultcode;
 [self UI];
 
 } failure:^(NSURLSessionTask *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 */
/*
 //POST请求
 //http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6
 
 NSURL *URL = [NSURL URLWithString:@"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&"];
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 //假如需要提交给服务器的参数是key＝1,class_id=100
 //创建一个可变字典
 NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
 //往字典里面添加需要提交的参数
 [parametersDic setObject:@"d162fbd409bfff09e7f2aca6a3948dd6" forKey:@"key"];
 //以post的形式提交，POST的参数就是上面的域名，parameters的参数是一个字典类型，将上面的字典作为它的参数
 [manager POST:URL.absoluteString parameters:parametersDic success:^(NSURLSessionTask *task, id responseObject) {
 NSLog(@"%@", responseObject);
 [self UI];
 
 } failure:^(NSURLSessionTask *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
*/
/* // 2.X.X版本   Get
 NSURL *URL = [NSURL URLWithString:@"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6"];
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 [manager GET:URL.absoluteString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"%@",responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError*error) {
 NSLog(@"失败");
 }];
 */

//1.3.4版本 GET
/*
 NSURL *URL = [NSURL URLWithString:@"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6"];
 
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];
 //    从URL获取json数据
 AFJSONRequestOperation *operation1 = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary* JSON) {
 NSLog(@"获取到的数据为：%@",JSON);
 } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {
 NSLog(@"发生错误！%@",error);
 }];
 [operation1 start];
 */

/*  1.3.4  AFHTTPClient  GET
 AFHTTPClient *bClient = [AFHTTPClient clientWithBaseURL :[NSURL URLWithString:@"http://app.buuyou.com/api/app?type=userlogin&data=490393730@qq.com,niuyao931026"]];
 //  [bClient setParameterEncoding:AFJSONParameterEncoding];
 //  http://v.juhe.cn/weather/index/?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6
 
 [bClient getPath:nil parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject)
 {
 NSLog(@"response description:%@",[responseObject description]);
 }
 failure:^(AFHTTPRequestOperation *operation,NSError *error)
 {
 NSLog(@"error description:%@",error);
 }];
 */


//    NSURL *URL = [NSURL URLWithString:@"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=d162fbd409bfff09e7f2aca6a3948dd6"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

//    AFHTTPRequestOperation * operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//        NSLog(@"success obj == %@",responseObject);
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//        NSLog(@"faild , error == %@ ", error);
//    }];
//
//    [operation start];
//  AFHTTPClient *bClient = [AFHTTPClient clientWithBaseURL :[NSURL URLWithString:@"http://app.buuyou.com/api/app?type=userlogin&data=490393730@qq.com,niuyao931026"]];

/*
AFHTTPClient * client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://app.buuyou.com/api/app?type=userlogin&data=490393730@qq.com,niuyao931026"]];

NSURLRequest * request = [client requestWithMethod:@"GET"
                                              path:nil
                                        parameters:nil];

AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
    
    NSLog(@"json == %@",JSON);
} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {
    
    NSLog(@"faild -- ");
}];

[operation start];

 */


/* 1.3.4 AFHTTPClient  post
 NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"123",@"num",@"jack",@"name",nil];
 
 
 AFHTTPClient *aClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://www.xxxx.com"]];
 
 //设置接受的数据类型为json
 
 [aClient setDefaultHeader:@"Accept"value:@"application/json"];
 //设置提交的数据编码类型为json格式
 [aClient setParameterEncoding:AFJSONParameterEncoding];
 [aClient postPath:nil parameters:dic success:^(AFHTTPRequestOperation *operation,id responseObject)
 {
 NSLog(@"response description:%@",[responseObject description]);
 }
 failure:^(AFHTTPRequestOperation *operation,NSError *error)
 {
 NSLog(@"error description:%@",[error description]);
 }];
 */
