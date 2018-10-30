//
//  MarketViewController.m
//  test
//
//  Created by niuy on 17/6/30.
//  Copyright © 2017年 niuy. All rights reserved.
//

#import "MarketViewController.h"

@interface MarketViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) UITableViewCell *cell;

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self columnButton];
    self.title = @"XY手机管家";
    [self tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 69)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 46)];
        _tableView.sectionHeaderHeight = 2.5;
        _tableView.sectionFooterHeight = 2.5;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //取消所有cell的分割线
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"lolCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else{//删除cell的所有子视图，避免cell重用错乱
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
        if (indexPath.section == 0) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
            imageView.image = [UIImage imageNamed:@"image0.jpeg"];
            [self.tableView addSubview:imageView];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, imageView.bottom+1, ScreenWidth, 1)];
            view.backgroundColor = [UIColor blackColor];
            [self.tableView addSubview:view];
            //cell.backgroundColor = [UIColor redColor];
            
        }else{
            //全民星秀 button+label
            UIButton *beautyBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 70, 70)]; //20, 84, 70, 70
            beautyBtn.layer.cornerRadius = 35;
            [beautyBtn setImage:[UIImage imageNamed:@"0.jpeg"] forState:UIControlStateNormal];
            [beautyBtn setClipsToBounds:YES];         //把button里的图片切割成和button一样大小
            //[beautyBtn addTarget:self action:@selector(beautyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:beautyBtn];
            UILabel *beautyLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, beautyBtn.bottom+10, 60, 10)];
            beautyLabel.text = @"全民星秀";
            beautyLabel.textColor = [UIColor blackColor];
            beautyLabel.font = [UIFont  boldSystemFontOfSize:12];
            beautyLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:beautyLabel];
            
            UIButton *lolBtn = [[UIButton alloc] initWithFrame:CGRectMake(beautyBtn.right+22, 0, 70, 70)];
            lolBtn.layer.cornerRadius = 35;
            [lolBtn setImage:[UIImage imageNamed:@"1.jpeg"] forState:UIControlStateNormal];
            [lolBtn setClipsToBounds:YES];
            //[lolBtn addTarget:self action:@selector(lolButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:lolBtn];
            UILabel *lolLabel = [[UILabel alloc] initWithFrame:CGRectMake(beautyLabel.right+32, lolBtn.bottom+10, 60, 10)];
            lolLabel.text = @"英雄联盟";
            lolLabel.textColor = [UIColor blackColor];
            lolLabel.font = [UIFont boldSystemFontOfSize:12];
            lolLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:lolLabel];
            
            
            UIButton *tvgameBtn = [[UIButton alloc] initWithFrame:CGRectMake(lolBtn.right+22, 0, 70, 70)];
            tvgameBtn.layer.cornerRadius = 35;
            [tvgameBtn setImage:[UIImage imageNamed:@"2.jpeg"] forState:UIControlStateNormal];
            [tvgameBtn setClipsToBounds:YES];
            //[tvgameBtn addTarget:self action:@selector(kingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:tvgameBtn];
            UILabel *tvgameLabel = [[UILabel alloc] initWithFrame:CGRectMake(lolLabel.right+32, tvgameBtn.bottom+10, 60, 10)];
            tvgameLabel.text = @"单机游戏";
            tvgameLabel.textColor = [UIColor blackColor];
            tvgameLabel.font = [UIFont boldSystemFontOfSize:12];
            tvgameLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:tvgameLabel];
            //
            UIButton *heartStoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, beautyLabel.bottom+20, 70, 70)];
            heartStoneBtn.layer.cornerRadius = 35;
            [heartStoneBtn setImage:[UIImage imageNamed:@"3.jpeg"] forState:UIControlStateNormal];
            [heartStoneBtn setClipsToBounds:YES];
            //[heartStoneBtn addTarget:self action:@selector(watchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:heartStoneBtn];
            UILabel *heartStoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, heartStoneBtn.bottom+10, 60, 10)];
            heartStoneLabel.text = @"炉石传说";
            heartStoneLabel.textColor = [UIColor blackColor];
            heartStoneLabel.font = [UIFont boldSystemFontOfSize:12];
            heartStoneLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:heartStoneLabel];
            
            UIButton *dota2Btn = [[UIButton alloc] initWithFrame:CGRectMake(heartStoneBtn.right+22, lolLabel.bottom+20, 70, 70)];
            dota2Btn.layer.cornerRadius = 35;
            [dota2Btn setImage:[UIImage imageNamed:@"4.jpeg"] forState:UIControlStateNormal];
            [dota2Btn setClipsToBounds:YES];
            //[dota2Btn addTarget:self action:@selector(lolButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:dota2Btn];
            UILabel *dota2Label = [[UILabel alloc] initWithFrame:CGRectMake(heartStoneLabel.right+32, dota2Btn.bottom+10, 60, 10)];
            dota2Label.text = @"DOTA2";
            dota2Label.textColor = [UIColor blackColor];
            dota2Label.font = [UIFont boldSystemFontOfSize:12];
            dota2Label.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:dota2Label];
            
            UIButton *huWaiBtn = [[UIButton alloc] initWithFrame:CGRectMake(dota2Btn.right+22, tvgameLabel.bottom+20, 70, 70)];
            huWaiBtn.layer.cornerRadius = 35;
            [huWaiBtn setImage:[UIImage imageNamed:@"5.jpeg"] forState:UIControlStateNormal];
            [huWaiBtn setClipsToBounds:YES];
            //[huWaiBtn addTarget:self action:@selector(beautyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:huWaiBtn];
            UILabel *huWaiLabel = [[UILabel alloc] initWithFrame:CGRectMake(dota2Label.right+32, huWaiBtn.bottom+10, 60, 10)];
            huWaiLabel.text = @"全民户外";
            huWaiLabel.textColor = [UIColor blackColor];
            huWaiLabel.font = [UIFont boldSystemFontOfSize:12];
            huWaiLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:huWaiLabel];
            
            UIButton *overWatchBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, heartStoneLabel.bottom+20, 70, 70)];
            overWatchBtn.layer.cornerRadius = 35;
            [overWatchBtn setImage:[UIImage imageNamed:@"6.jpeg"] forState:UIControlStateNormal];
            [overWatchBtn setClipsToBounds:YES];
            //[overWatchBtn addTarget:self action:@selector(watchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:overWatchBtn];
            UILabel *overWatchLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, overWatchBtn.bottom+10, 60, 10)];
            overWatchLabel.text = @"守望先锋";
            overWatchLabel.textColor = [UIColor blackColor];
            overWatchLabel.font = [UIFont boldSystemFontOfSize:12];
            overWatchLabel.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:overWatchLabel];
            
            UIButton *beauty8Btn = [[UIButton alloc] initWithFrame:CGRectMake(overWatchBtn.right+22, dota2Label.bottom+20, 70, 70)];
            beauty8Btn.layer.cornerRadius = 35;
            [beauty8Btn setImage:[UIImage imageNamed:@"0.jpeg"] forState:UIControlStateNormal];
            [beauty8Btn setClipsToBounds:YES];
            //[beauty8Btn addTarget:self action:@selector(allCategoreAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:beauty8Btn];
            UILabel *beauty8Label = [[UILabel alloc] initWithFrame:CGRectMake(overWatchLabel.right+32, beauty8Btn.bottom+10, 60, 10)];
            beauty8Label.text = @"全部分类";
            beauty8Label.textColor = [UIColor blackColor];
            beauty8Label.font = [UIFont boldSystemFontOfSize:12];
            beauty8Label.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:beauty8Label];
        }
    
    return cell;
}


#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 135;
    }else if (indexPath.section == 1){
        return 450;
    }
    return 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
