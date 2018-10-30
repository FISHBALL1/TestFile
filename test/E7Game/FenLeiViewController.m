//
//  FenLeiViewController.m
//  test
//
//  Created by niuy on 17/10/19.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "FenLeiViewController.h"
#import "CategoryTableViewCell.h"
#import "ChosenTableViewCell.h"
@interface FenLeiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *categoryView;

@end

@implementation FenLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.categoryView];
}

- (UITableView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.delegate = self;
        _categoryView.dataSource = self;
        _categoryView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
        _categoryView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
        _categoryView.sectionHeaderHeight = 0;
        _categoryView.sectionFooterHeight = 0;
        _categoryView.showsVerticalScrollIndicator = NO;
        _categoryView.separatorStyle = UITableViewCellSeparatorStyleNone; //取消所有cell的分割线
        [self.view addSubview:self.categoryView];
    }
    return _categoryView;
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChosenTableViewCell *chosenCell;
    
    if (indexPath.section == 0) {
        CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kMyGameCellIdentifier"];
        if (!cell) {
            cell = [[CategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kMyGameCellIdentifier"];
        }
        return cell;
    }else if (indexPath.section == 1){
        chosenCell = [tableView dequeueReusableCellWithIdentifier:@"kChoseCellIdentifier"];
        if (!chosenCell) {
            chosenCell = [[ChosenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kChoseCellIdentifier"];
        }
        return chosenCell;
        
    }else {
        chosenCell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentifier"];
        if (!chosenCell) {
            chosenCell = [[ChosenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kCellIdentifier"];
        }

    }
    return chosenCell;
}


#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
