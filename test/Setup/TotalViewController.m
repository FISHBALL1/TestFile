//
//  TotalViewController.m
//  test
//
//  Created by niuy on 17/8/23.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "TotalViewController.h"
#import "StarLevelView.h"

@interface TotalViewController ()
@property (nonatomic, strong) NSMutableArray *videoArray;
@property (nonatomic, strong) NSMutableArray *nickArray;
@property (nonatomic, strong) NSMutableArray *videoArray2;
@property (nonatomic, strong) NSMutableArray *nickArray2;
@property (nonatomic, assign) NSInteger date_time;
@property (nonatomic, strong) NSString *userDate;

@property (nonatomic, strong) UIButton *checkBtn;

@property (nonatomic, strong) UITextField *textfiled;

@property (nonatomic, strong) StarLevelView *levelView;
@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self UI];
    //字典 数组 混合
    
    
    NSArray *arrAndDis=@[
                          @{@"time":@"2017年9月1日",@"video":@"1",@"nick":@"曾经的你"},
                          
                          @{@"time":@"2017年9月4日",@"video":@"2",@"nick":@"未来的你"},
                          
                          @{@"time":@"2017年9月2日",@"video":@"3",@"nick":@"现在的你"},
                          
                          @{@"time":@"2017年9月3日",@"video":@"4",@"nick":@"以后的你"},
                          
                          @{@"time":@"2017年9月3日",@"video":@"5",@"nick":@"以后的你"},
                          
                          @{@"time":@"2017年9月2日",@"video":@"6",@"nick":@"现在的你"},
                          
                          @{@"time":@"2017年9月4日",@"video":@"7",@"nick":@"未来的你"}];
    
    
    NSArray *sortAndDis=@[
                          @[
                              @{@"time":@"2017年9月4日",@"video":@"6",@"nick":@"未来的你"},
                              @{@"time":@"2017年9月4日",@"video":@"7",@"nick":@"未来的你"}
                              ],
                          
                          @[
                              @{@"time":@"2017年9月3日",@"video":@"4",@"nick":@"以后的你"},
                              @{@"time":@"2017年9月3日",@"video":@"5",@"nick":@"以后的你"},
                              ],
                          
                          @[
                              @{@"time":@"2017年9月2日",@"video":@"3",@"nick":@"现在的你"},
                              @{@"time":@"2017年9月2日",@"video":@"6",@"nick":@"现在的你"},
                              ],
                          
                         @[
                              @{@"time":@"2017年9月1日",@"video":@"1",@"nick":@"曾经的你"},
                              ]

                           ];
    
//    NSMutableArray *timeArray = [[NSMutableArray alloc] init];
//    NSMutableArray *totalArray = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i<arrAndDis.count; i++) {
//        [timeArray addObject:arrAndDis[i][@"time"]];
//        [totalArray addObject:arrAndDis[i][@"video"]];
//    }

    
    NSMutableArray *transitArr = [NSMutableArray arrayWithArray:arrAndDis];
    
    NSMutableDictionary *dicSource = [NSMutableDictionary dictionaryWithCapacity:5];
    for (int i = 0; i< transitArr.count; i++)
    {
        [dicSource setValue:@"" forKey:transitArr[i][@"time"]];
    }
    
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [dicSource allKeys].count; k++) {
        [keyArray addObject:[dicSource allKeys][k]];
    }
    
    //对keyArray里进行降序排列
    NSSortDescriptor *keySortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    [keyArray sortUsingDescriptors:@[keySortDescriptor]];
    
    
    NSMutableArray *destinationArr = [[NSMutableArray alloc] init];
    for (int j = 0; j< keyArray.count; j++)
    {
        NSString *match1 = [NSString stringWithFormat:@"SELF.time = '%@'",keyArray[j]];
        NSPredicate *predicate1 = [NSPredicate predicateWithFormat:match1];
        [destinationArr addObject:[transitArr filteredArrayUsingPredicate:predicate1]];
    }
    NSLog(@"dataSource1 = %@",destinationArr);
    
     NSString *wenbbst = destinationArr[0][0][@"nick"];
    
    NSLog(@"%@",wenbbst);
    [self date_time];
    [self text];
    
    
    
    
    /*  谓词筛选，，CONTAINS包含语法
    NSArray *array = [[NSArray alloc]initWithObjects:@"beijing",@"shanghai",@"guangzou",@"wuhan", nil];
    NSString *string = @"ang";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",string];
    NSLog(@"wo%@",[array filteredArrayUsingPredicate:pred]);
    */
    
    
    /* 给数组里存入的字符串进行排序
     NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
     NSArray *descriptors = [NSArray arrayWithObject:descriptor];
     
     NSArray *myDataArray = [NSArray arrayWithObjects:@"09月19日",@"09月21日",@"09月20日",@"09月18日",@"09月11日",@"09月15日", nil];
     NSArray *sortedArray = [myDataArray sortedArrayUsingDescriptors:descriptors];
     NSLog(@"%@", sortedArray);
     */
    
    /*
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSMutableArray *myDataArray = [NSMutableArray arrayWithObjects:@"09月19日",@"09月21日",@"09月20日",@"09月18日",@"09月11日",@"09月15日", nil];
    [myDataArray sortUsingDescriptors:@[descriptor]];
    NSLog(@"%@", myDataArray);
    */
}

- (NSInteger)date_time {
    _date_time = 1296035591;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月DD日"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_date_time];
    
    _userDate = [formatter stringFromDate:date];
    
    //NSLog(@"womde%ld",(long)[userDate integerValue]);
    
    return 0;
}

- (void)text {
    NSLog(@"wode%@",_userDate);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UI {
    _levelView = [StarLevelView new];
    _levelView.starCount = 5;
    _levelView.margin = 5;
    _levelView.level = 3; //星级
    _levelView.starSize = CGSizeMake(10, 10);
    [self.view addSubview:_levelView];
    [_levelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(150);
        make.top.mas_equalTo(150);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(80);
    }];
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
