//
//  niuyaoViewController.m
//  test
//
//  Created by niuy on 16/12/4.
//  Copyright © 2016年 niuy. All rights reserved.
//
/*
#import "AmbitusCityTypeModel.h"
#import "JSONModel.h"
@interface AmbitusCityTypeModel
@property (nonatomic, assign) NSInteger city_id;
@property (nonatomic, strong) NSString *city_name;

@property (nonatomic, strong) NSString *begin_key;
@property (nonatomic, strong) NSMutableArray<AmbitusCityTypeModel *> *city_list;


@end

@implementation AmbitusCityTypeModel

// 解析过程如下
- (void)setUpData {
    NSString *urlString = [NSString stringWithFormat:@"%@",@"http://api.lanrenzhoumo.com/district/list/allcity?session_id=00004016b3e14bbea40c1aa1a14c2273a35352"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    self.dataArray = [LoanModel arrayOfModelsFromDictionaries:tempArr];
    self.dataArray = [NSMutableArray array];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    self.dataArray = [NSMutableArray array];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            if (data) {
                NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
                self.dataArray = [TypeTwoModel arrayOfModelsFromDictionaries:[tempDict valueForKey:@"result"]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }
    }];
    [dataTask resume];
    
}
@end
*/