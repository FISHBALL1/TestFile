//
//  STCalendarViewController.m
//  test
//
//  Created by niuy on 17/8/22.
//  Copyright © 2017年 niuy. All rights reserved.
//
/*
#import "STCalendarViewController.h"
#import "FSCalendarAppearance.h"
#import "FSCalendar.h"
#import <EventKit/EventKit.h>
@interface STCalendarViewController ()<FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance>
@property (nonatomic, strong) FSCalendar *calendar;
@property(strong, nonatomic) NSCalendar *gregorianCalendar;

@end

@implementation STCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
//    calendar.dataSource = self;
//    calendar.delegate = self;
//    [self.view addSubview:calendar];
//    self.calendar = calendar;
    
    
    
    [self calendar];
    
}

- (FSCalendar *)calendar {
    if (!_calendar) {
        _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 100, 320, 300)];
        [self.view addSubview:_calendar];
        _calendar.dataSource = self;
        _calendar.delegate = self;
        //设置翻页方式为水平
        _calendar.scrollDirection = FSCalendarScrollDirectionVertical;
        //设置是否用户多选
        _calendar.allowsMultipleSelection = NO;
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase|FSCalendarCaseOptionsWeekdayUsesSingleUpperCase;
        //这个属性控制"上个月"和"下个月"标签在静止时刻的透明度
        _calendar.appearance.headerMinimumDissolvedAlpha = 0;
        _calendar.backgroundColor = [UIColor redColor];//[ToolHelper colorWithHexString:@"#368de7"];
        //设置周字体颜色
        _calendar.appearance.weekdayTextColor = [UIColor whiteColor];
        //设置头字体颜色
        _calendar.appearance.headerTitleColor = [UIColor whiteColor];

        //设置当天的字体颜色
        //_calendar.todayColor = [UIColor blueColor];
        
        self.gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        
    }
    return _calendar;
}



- (UIImage *)calendar:(FSCalendar *)calendar imageForDate:(nonnull NSDate *)date {
    
    if ([self.gregorianCalendar isDateInToday:date]) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        //image.backgroundColor = [UIColor blackColor];
        image.image = [UIImage imageNamed:@"积分"];
        return image.image;
    }else {
        return 0;
    }
}

//- (NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date
//{
//    if ([self.gregorianCalendar isDateInToday:date]) {
//        return @"今天";
//    }
//    return nil;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
*/
