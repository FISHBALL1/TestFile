//
//  MineViewController.m
//  test
//
//  Created by niuy on 16/11/16.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "MineViewController.h"
#import "MineButton.h"
#import "selectSexViewController.h"
#import "AIDatePickerController.h"
@interface MineViewController ()
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *labelTitle ;
@property (nonatomic,strong) UILabel *signature;
@property (nonatomic,strong) UILabel *nickLabel;
@property (nonatomic,strong) UILabel *sexLabel;
@property (nonatomic,strong) UILabel *birthdayLabel;
@property (nonatomic,strong) UILabel *myLabel;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:SMWhiteColor];//[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]
    [self.navigationController setNavigationBarHidden:YES];
    
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    //顶部个人中心tab bar
    //[topView setBackgroundColor:[UIColor whiteColor]];
    [topView setBackgroundColor:[UIColor blueColor]];
    self.labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 33, ScreenWidth, 18)];
    self.labelTitle.font = SMSystemBoldFont(17);
    self.labelTitle.text = NSLocalizedString(@"个人中心", nil);
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.labelTitle];
    [self.view addSubview:topView];
    
    UIScrollView *backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-113)];
    backScrollView.alwaysBounceVertical = YES;
    backScrollView.showsVerticalScrollIndicator = NO;
    //backScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:backScrollView];
    
    //底层view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 2 * ScreenHeight)];
    [view setBackgroundColor:[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]];
    //[view setBackgroundColor:[UIColor blackColor]];
    [backScrollView addSubview:view];
    //CGFloat viewMaxY = 0;
    //CGFloat viewHeight = 236;
    //头部图像处view
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 336)];
    [headView setBackgroundColor:[UIColor whiteColor]];
    //[headView setBackgroundColor:[UIColor redColor]];
    UITapGestureRecognizer *tapLogin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userLogin)];
    [headView addGestureRecognizer:tapLogin];
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-100, 15, 60, 60)];
    self.headImageView.backgroundColor = [UIColor lightGrayColor];
    self.headImageView.image = [UIImage imageNamed:@"defaultHead"];
    self.headImageView.layer.cornerRadius = 40;
    self.headImageView.clipsToBounds = YES;
    CGFloat viewMaxY = 10;
    CGFloat viewHeight = 67;
    //1
    //MineButton *button = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    MineButton *button = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button.tag = 0;
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"头像", nil)];
    button.backgroundColor = [UIColor greenColor];
    [headView addSubview:button];
    
    viewMaxY += viewHeight+1; //78
    viewHeight = 1/mainScale;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView];
    
    //2
    viewMaxY += viewHeight; //78+1/2
    viewHeight = 67;
    //3
    
    MineButton *button1 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button1.tag = 5;
    [button1 addTarget:self action:@selector(modifyNick) forControlEvents:UIControlEventTouchUpInside];
    [button1 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"昵称", nil)];
    button1.backgroundColor = [UIColor greenColor];
    [headView addSubview:button1];
    
    //设置label昵称nickLabel
    modifyNickViewController *modify = [[modifyNickViewController alloc] init];
    _nickLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 80, 150, 50)];
    _nickLabel.text = @"我的昵称";
    //在label显示从modifyNickViewController传过来的值
   // _nickLabel.text = self.nickText;
    _nickLabel.font = [UIFont systemFontOfSize:16];//采用系统默认文字设置大小
    _nickLabel.textColor = [UIColor redColor];
    _nickLabel.tag = 1;
    [headView addSubview:_nickLabel];
   
    viewMaxY += viewHeight+1; //78+1/2+67+1
    viewHeight = 1/mainScale;
    //4
    UIView *lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView3 setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView3];
    //
    viewMaxY += viewHeight;  //78+1/2+67+1/2
    viewHeight = 67;
    MineButton *button2 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button2.tag = 6;
    [button2 addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"账号", nil)];
    button2.backgroundColor = [UIColor greenColor];
    [headView addSubview:button2];
    //
    viewMaxY += viewHeight+1; //78+1/2+67+67+1
    viewHeight = 1/mainScale;
    //
    UIView *lineView4 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView4 setBackgroundColor:[UIColor redColor]];
    [headView addSubview:lineView4];
    //
    viewMaxY += viewHeight;  //78+1/2+67+1/2
    viewHeight = 67;
    MineButton *button3 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button3.tag = 7;
    [button3 addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"手机", nil)];
    button3.backgroundColor = [UIColor greenColor];
    [headView addSubview:button3];
    
    [headView addSubview:self.headImageView];
    [backScrollView addSubview:headView];
    
    viewMaxY += (viewHeight+10);
    viewHeight = 67;
    
    //
    /*
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, 67 * 2 + 2 / mainScale)];
    [backView1 setBackgroundColor:SMWhiteColor];
    //[backView1 setBackgroundColor:[UIColor greenColor]];
    [backScrollView addSubview:backView1];
    */
    //button
    
    MineButton *buttonCollect = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    buttonCollect.tag = 1;
    [buttonCollect addTarget:self action:@selector(selectSex) forControlEvents:UIControlEventTouchUpInside];
    [buttonCollect setButtonIcom:[UIImage imageNamed:@"myCollect"] andButtonTitle:NSLocalizedString(@"性别", nil)];
     buttonCollect.backgroundColor = [UIColor greenColor];
    [backScrollView addSubview:buttonCollect];
    
    //设置签名sex
    _sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 300, 150, 50)];
    _sexLabel.text = @"男";
    _sexLabel.font = [UIFont systemFontOfSize:16];//采用系统默认文字设置大小
    _sexLabel.textColor = [UIColor redColor];
    _sexLabel.tag = 8;
    [backScrollView addSubview:_sexLabel];
    //
    viewMaxY += viewHeight+1;
    viewHeight = 1/mainScale;
    
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    //[lineView1 setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView1 setBackgroundColor:[UIColor redColor]];
    [backScrollView addSubview:lineView1];
    
    viewMaxY += viewHeight;
    viewHeight = 67;
    
    MineButton *buttonDownPrice = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    buttonDownPrice.tag = 2;
    [buttonDownPrice addTarget:self action:@selector(birthday) forControlEvents:UIControlEventTouchUpInside];
    [buttonDownPrice setButtonIcom:[UIImage imageNamed:@"downPrice"] andButtonTitle:@"生日"];
    buttonDownPrice.backgroundColor = [UIColor greenColor];
    [backScrollView addSubview:buttonDownPrice];
     
    //生日label
    _birthdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 370, 150, 50)];
    _birthdayLabel.text = @"1994-01-20";
    _birthdayLabel.font = [UIFont systemFontOfSize:16];
    _birthdayLabel.textColor = [UIColor redColor];
    _birthdayLabel.tag = 9;
    [backScrollView addSubview:_birthdayLabel];
    
    
    viewMaxY += viewHeight+1;
    viewHeight = 1/mainScale;
        
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
       // [lineView2 setBackgroundColor:SMHexColor(0xE8E8E8)];
        [lineView2 setBackgroundColor:[UIColor redColor]];
        [backScrollView addSubview:lineView2];
    
    viewMaxY += viewHeight;
    viewHeight = 67;
    
    MineButton *buttonFeedback = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    buttonFeedback.tag = 3;
    [buttonFeedback addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonFeedback setButtonIcom:[UIImage imageNamed:@"feedBack"] andButtonTitle:NSLocalizedString(@"地区", nil)];
    buttonFeedback.backgroundColor = [UIColor greenColor];
    [backScrollView addSubview:buttonFeedback];
    
    //
    //
    viewMaxY += viewHeight+1;
    viewHeight = 1/mainScale;
    UIView *lineView6 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    // [lineView2 setBackgroundColor:SMHexColor(0xE8E8E8)];
    [lineView6 setBackgroundColor:[UIColor redColor]];
    [backScrollView addSubview:lineView6];
    //
    viewMaxY += (viewHeight);
    viewHeight = 67;
    
    MineButton *button5 = [[MineButton alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, viewHeight)];
    button5.tag = 7;
    [button5 addTarget:self action:@selector(modifySignature) forControlEvents:UIControlEventTouchUpInside];
    [button5 setButtonIcom:[UIImage imageNamed:@"feedBack"] andButtonTitle:NSLocalizedString(@"签名", nil)];
    button5.backgroundColor = [UIColor greenColor];
    [backScrollView addSubview:button5];
    
    //设置签名signature
    _signature = [[UILabel alloc]initWithFrame:CGRectMake(250, 500, 150, 50)];
    _signature.text = @"我的签名";
    //在label显示从SignatureViewController传过来的值
   // signature.text = self.recvText;
    _signature.font = [UIFont systemFontOfSize:16];//采用系统默认文字设置大小
    _signature.textColor = [UIColor redColor];
    _signature.tag = 8;
    [backScrollView addSubview:_signature];

    viewMaxY += (viewHeight+10);
    viewHeight = 67;
    
    
    //
    /*
    UIView *backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, viewMaxY, ScreenWidth, 67 + 1/mainScale)];
    //[backView2 setBackgroundColor:SMWhiteColor];
    [backView2 setBackgroundColor:[UIColor blueColor]];
    [backScrollView addSubview:backView2];
    */
    
    
    viewMaxY += (viewHeight);
    viewHeight = 67;
    
    [backScrollView setContentSize:CGSizeMake(0, viewMaxY)];
    backScrollView.bounces = YES;
}
/*
-(void)viewWillAppear:(BOOL)animated{
    
    if ([[ASUserModel instance] isLogin]) {
        NSString *avatar = [ASUserModel instance].avatarUrl;
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:@"defaultHead"] options:SDWebImageRetryFailed];
        self.labelTitle.text = ([[ASUserModel instance].userNickName isEqualToString:@""] || [ASUserModel instance].userNickName == nil) ? [ASUserModel instance].userName : [ASUserModel instance].userNickName;
    }

}
*/
//实现代理方法
-(void) nickText:(NSString *)text1{
    
    self.nickLabel.text = text1;
    
}

-(void) changeText:(NSString *)text
{
    self.signature.text = text;
}

-(void) selectMan:(NSString *)man{

    self.sexLabel.text = man;
}
//修改昵称
-(void) modifyNick{
    
    modifyNickViewController *modifyNick = [[modifyNickViewController alloc] init];
    modifyNick.delegate = self;
    [self.navigationController pushViewController:modifyNick animated:YES];
    
}

//修改签名
-(void) modifySignature{

    SignatureViewController *sig = [[SignatureViewController alloc] init];
    sig.delegate =self;
    [self.navigationController pushViewController:sig animated:YES]; //YES是推出下一个页面，NO是突然跳出来下一个页面

}

//选择性别
-(void) selectSex{

    selectSexViewController *sex = [[selectSexViewController alloc] init];
    sex.delegate = self;
    [self.navigationController pushViewController:sex animated:YES];

}

//设置生日
-(void) birthday{
    
    __weak MineViewController *weakSelf = self;
    
    // Creating a date
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:@"1955-02-24"];
    
    AIDatePickerController *datePickerViewController = [AIDatePickerController pickerWithDate:date selectedBlock:^(NSDate *selectedDate) {
        __strong MineViewController *strongSelf = weakSelf;
        
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        //把NSDate格式转化成改成NSSting格式
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *strDate = [dateFormatter stringFromDate:selectedDate];
        NSLog(@"%@", strDate);
        _birthdayLabel.text = strDate;
        
        
        
    } cancelBlock:^{
        __strong MineViewController *strongSelf = weakSelf;
        
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
    
    [self presentViewController:datePickerViewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end


