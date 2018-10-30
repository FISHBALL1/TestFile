//
//  StudyViewController.m
//  test
//
//  Created by niuy on 16/12/13.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "StudyViewController.h"
#import "UserModel.h"
#define cellHeight @47

@interface StudyViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *Study;
@property (nonatomic,strong) NSArray *infoArray;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIImage *Image;
//@property (nonatomic ,strong) UIImageView *imageView;
@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Study];
    self.view.backgroundColor = [UIColor whiteColor];
    [self Model];
}

- (UITableView *)Study {
    if(!_Study) {
       _Study = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_Study];
        [_Study mas_makeConstraints:^(MASConstraintMaker *make){
            
            make.top.mas_equalTo(self.view);
            make.left.mas_equalTo(self.view);
            make.width.mas_equalTo(self.view);
            make.height.mas_equalTo(self.view);
            
        }];
        _Study.dataSource = self;
        _Study.delegate = self;
        _Study.backgroundColor = [UIColor whiteColor];

    }
    return _Study;
}
/*
- (void)reloadInfoArray{
    self.infoArray = @[@[@"头像",@"niuyao",cellHeight],
                        @[@"账号",_text,cellHeight],
                       ];
    
}

- (void)setUserObject:(NSObject *)object forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //[self reloadInfoArray];
}
*/
#pragma mark - UITableViewDataSource
//有两个分区

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//每个分区有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

//分区头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"第一个";
    }else{
        return @"第二个";
    }
}

//给单元格添加内容  // section属性，row属性
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        static NSString *infoCellIdentifier = @"infoCellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //cell上添加本地图片      第二个分区上的第二行
        if (indexPath.section == 1 && indexPath.row == 1) {
        UIImageView *imageview = [[UIImageView alloc] init];
        [cell.contentView addSubview:imageview];      //加到cell.contentView里
        imageview.image = [UIImage imageNamed:@"loading_blue_0008"];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@60);
            make.right.centerY.equalTo(cell.contentView);
            
        }];
        
        UIButton *cellButton = [[UIButton alloc] init];
        [cellButton setTitle:@"niuyao" forState:UIControlStateNormal];
        [cellButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.contentView addSubview:cellButton];    //加到cell的contentView里
        [cellButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.contentView).mas_offset(10);
            make.left.mas_equalTo(cell.contentView).mas_offset(250);
        }];
    }
    /*
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.text = self.infoArray[indexPath.row][0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.text = self.infoArray[indexPath.row][1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    */
  //  cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - UITableViewDataDelegate
//用户触摸cell响应操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            NSLog(@"niuyao");
            break;
        case 1:
            NSLog(@"wode");
            break;
        default:
            break;
    }
}
/*
//cell每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
*/
//设置组表的头标签高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150;
    }else{
    }
    return 0;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 ) {
        return 67;
    }
    else{
        return 67;
    }
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) Model{
    /*
     //1.3.4 GET AFHTTPClient
     AFHTTPClient * client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://v.juhe.cn/weather"]];
     //创建一个可变字典
     NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
     //往字典里面添加需要提交的参数
     [parametersDic setObject:@"d162fbd409bfff09e7f2aca6a3948dd6" forKey:@"key"];
     [parametersDic setObject:@"苏州" forKey:@"cityname"];
     NSURLRequest * request = [client requestWithMethod:@"GET"
     path:@"index"
     parameters:parametersDic];
     
     AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
     NSLog(@"json == %@",JSON);
     UserModel *model = [[UserModel alloc] initWithDictionary:JSON error:nil];
     NSLog(@"%@",model.resultcode);// 正常的 字典
     NSLog(@"%@",model.result.sk.wind_direction);
     //  NSLog(@"%@",model.result.future[0]);// 嵌套 model数组
     _text = model.result.sk.wind_direction;
     [self reloadInfoArray];
     [_Study reloadData];   //刷新表单
     
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {
     
     NSLog(@"faild -- ");
     }];
     
     [operation start];
     */
    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    NSLog(@"%@",dic1);
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1" , @"a",
                          @"2" , @"b",
                          @"3" , @"c",
                           nil];
    NSLog(@"%@",dic2);
}

@end

//重要代码 ，暂存！！
/*
 - (void)recommendation2{
 UIView *recommendationView2 = [[UIView alloc] initWithFrame:CGRectMake(0, _bannerView.bottom+120+15, ScreenWidth, viewHeight)];
 recommendationView2.backgroundColor = [UIColor whiteColor];
 [self.tableView addSubview:recommendationView2];
 
 UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(-15, 10, 30, 20)];
 icon.image = [UIImage imageNamed:@"redline.png"];
 [recommendationView2 addSubview:icon];
 
 UILabel *recommendationLabel = [[UILabel alloc] initWithFrame:CGRectMake(icon.right, 10, 70, 20)];
 recommendationLabel.text = @"精彩推荐";
 recommendationLabel.textColor = HexColor(0x272b3c);
 recommendationLabel.font = [UIFont boldSystemFontOfSize:17];
 recommendationLabel.textAlignment = NSTextAlignmentCenter;
 [recommendationView2 addSubview:recommendationLabel];
 
 UIButton *changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-recommendationLabel.right+15, 15, 70, 15)];
 [changeBtn setTitle:@"换一换" forState:UIControlStateNormal];
 [changeBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
 [changeBtn setTitleColor:HexColor(0x9b9fad) forState:(UIControlStateNormal)];
 [changeBtn addTarget:self action:@selector(recommendation) forControlEvents:UIControlEventTouchUpInside];
 [changeBtn setImage:[UIImage imageNamed:@"change.png"] forState:UIControlStateNormal];
 [changeBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
 [changeBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -changeBtn.imageView.width+3, 0, 0)];
 [changeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, changeBtn.titleLabel.right+3, 0, 0)];
 [recommendationView2 addSubview:changeBtn];
 
 //精彩推荐栏的第一个button
 UIButton *recommendationBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, recommendationLabel.bottom+10, (ScreenWidth-15*2-10*2)/3, recommendationView2.height-20-recommendationLabel.height)];
 recommendationBtn.layer.cornerRadius = 3;
 recommendationBtn.layer.masksToBounds = YES;
 //画面
 UIImageView *thumb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, recommendationBtn.width, 150)];
 [thumb sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].thumb4]];
 [recommendationBtn addSubview:thumb];
 //头像
 UIButton *avatarBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, thumb.bottom+10, 35, 35)];
 avatarBtn.layer.cornerRadius = 17.5;
 [avatarBtn setClipsToBounds:YES];
 UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
 [avatarView sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].avatar4]];
 [avatarBtn addSubview:avatarView];
 [recommendationBtn addSubview:avatarBtn];
 //昵称
 UILabel *nick = [[UILabel alloc] initWithFrame:CGRectMake(avatarBtn.right+5, thumb.bottom+11, 200, 15)];
 nick.text = [LocalUser instance].nick4;
 nick.font = [UIFont boldSystemFontOfSize:14];
 nick.textColor = HexColor(0x272b3c);
 [recommendationBtn addSubview:nick];
 //标题
 UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(avatarBtn.right+5, nick.bottom+2, 200, 15)];
 title.text = [LocalUser instance].title4;
 title.font = [UIFont boldSystemFontOfSize:12];
 title.textColor = HexColor(0x9b9fad);
 [recommendationBtn addSubview:title];
 [recommendationView2 addSubview:recommendationBtn];
 
 //精彩推荐栏的第二个button
 UIButton *recommendationBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(recommendationBtn.right+10, recommendationLabel.bottom+10, (ScreenWidth-15*2-10*2)/3, recommendationView2.height-20-recommendationLabel.height)];
 recommendationBtn2.layer.cornerRadius = 3;
 recommendationBtn2.layer.masksToBounds = YES;
 //画面
 UIImageView *thumb2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, recommendationBtn.width, 150)];
 [thumb2 sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].thumb5]];
 [recommendationBtn2 addSubview:thumb2];
 //头像
 UIButton *avatar2Btn = [[UIButton alloc] initWithFrame:CGRectMake(0, thumb2.bottom+10, 35, 35)];
 avatar2Btn.layer.cornerRadius = 17.5;
 avatar2Btn.clipsToBounds = YES;
 UIImageView *avatar2View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
 [avatar2View sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].avatar5]];
 [avatar2Btn addSubview:avatar2View];
 [recommendationBtn2 addSubview:avatar2Btn];
 //昵称
 UILabel *nick2 = [[UILabel alloc] initWithFrame:CGRectMake(avatar2Btn.right+5, thumb2.bottom+11, 200, 15)];
 nick2.text = [LocalUser instance].nick5;
 nick2.font = [UIFont boldSystemFontOfSize:14];
 nick2.textColor = HexColor(0x272b3c);
 [recommendationBtn2 addSubview:nick2];
 //标题
 UILabel *title2 = [[UILabel alloc] initWithFrame:CGRectMake(avatar2Btn.right+5, nick2.bottom+2, 200, 15)];
 title2.text = [LocalUser instance].title5;
 title2.font = [UIFont boldSystemFontOfSize:12];
 title2.textColor = HexColor(0x9b9fad);
 [recommendationBtn2 addSubview:title2];
 [recommendationView2 addSubview:recommendationBtn2];
 
 //精彩推荐栏的第三个button
 UIButton *recommendationBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(recommendationBtn2.right+10, recommendationLabel.bottom+10, (ScreenWidth-15*2-10*2)/3, recommendationView2.height-20-recommendationLabel.height)];
 recommendationBtn3.layer.cornerRadius = 3;
 recommendationBtn3.layer.masksToBounds = YES;
 //画面
 UIImageView *thumb3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, recommendationBtn.width, 150)];
 [thumb3 sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].thumb6]];
 [recommendationBtn3 addSubview:thumb3];
 
 //头像
 UIButton *avatar3Btn = [[UIButton alloc] initWithFrame:CGRectMake(0, thumb3.bottom+10, 35, 35)];
 avatar3Btn.layer.cornerRadius = 17.5;
 avatar3Btn.clipsToBounds = YES;
 UIImageView *avatar3View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
 [avatar3View sd_setImageWithURL:[NSURL URLWithString:[LocalUser instance].avatar6]];
 [avatar3Btn addSubview:avatar3View];
 [recommendationBtn3 addSubview:avatar3Btn];
 //昵称
 UILabel *nick3 = [[UILabel alloc] initWithFrame:CGRectMake(avatar3Btn.right+5, thumb3.bottom+11, 200, 15)];
 nick3.text = [LocalUser instance].nick6;
 nick3.font = [UIFont boldSystemFontOfSize:14];
 nick3.textColor = HexColor(0x272b3c);
 [recommendationBtn3 addSubview:nick3];
 //标题
 UILabel *title3 = [[UILabel alloc] initWithFrame:CGRectMake(avatar3Btn.right+5, nick3.bottom+2, 200, 15)];
 title3.text = [LocalUser instance].title6;
 title3.font = [UIFont boldSystemFontOfSize:12];
 title3.textColor = HexColor(0x9b9fad);
 [recommendationBtn3 addSubview:title3];
 [recommendationView2 addSubview:recommendationBtn3];
 }

 
 */


























