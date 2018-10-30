//
//  FindViewController.m
//  test
//
//  Created by niuy on 17/3/26.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<NSNetServiceBrowserDelegate,NSNetServiceDelegate>
@property (nonatomic, strong) NSNetServiceBrowser *serviceBrowser;
@property (nonatomic, strong) NSNetService *service;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _serviceBrowser = [[NSNetServiceBrowser alloc] init];
    _serviceBrowser.delegate = self;
    [_serviceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"local."];
    
    
     _service = [[NSNetService alloc] initWithDomain:@"local." type:@"_http._tcp." name:@"DamonWebServer" port:psort];
    
    [_service setDelegate:self];
    [_service publish];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing{
    
    NSLog(@"%@",netService);

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
