//
//  TapViewController.m
//  test
//
//  Created by niuy on 17/7/4.
//  Copyright © 2017年 niuy. All rights reserved.
//
//基本的手势的实际运用
#import "TapViewController.h"
#define kImageCount 3

@interface TapViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property int currentIndex;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试手势";
    self.view.backgroundColor = [UIColor whiteColor];
    [self imageView];
    [self addGesture];
    
}

#pragma mark 布局
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 450, 300)];
        _imageView.image = [UIImage imageNamed:@"image0"];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;  //这里必须设置位YES，否则无法接收手势操作
        /*
         UIImageView 默认的userInteractionEnabled是NO；
         UILabel默认 userInteractionEnabled是NO；
         UIView的userInteractionEnabled默认是YES。
         当视图对象的userInteractionEnabled设置为NO的时候，用户触发的事件，如触摸事件，键盘弹出事件。。等，将会被该视图忽略（其他视图照常响应），并且该视图对象也会从事件响应队列中被移除。当userInteractionEnabled设为YES时，则事件可以正常的传递给该视图对象。
         */
        [self.view addSubview:_imageView];
        
    }
    return _imageView;
}

#pragma mark 下一张图片
-(void)nextImage{
    int index=(_currentIndex+kImageCount+1)%kImageCount;
    NSString *imageName=[NSString stringWithFormat:@"image%i",index];
    NSLog(@"niuyaodeimage%i",index);
    _imageView.image=[UIImage imageNamed:imageName];
    _currentIndex=index;
}

#pragma mark 上一张图片
-(void)lastImage{
    int index=(_currentIndex+kImageCount-1)%kImageCount;
    NSString *imageName=[NSString stringWithFormat:@"image%i",index];
    NSLog(@"wodedeimage%i",index);
    _imageView.image=[UIImage imageNamed:imageName];
    _currentIndex=index;
}

#pragma mark 添加手势
- (void)addGesture {
    //点按手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [self.imageView addGestureRecognizer:tapGesture];
    
    //长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
    longPressGesture.minimumPressDuration = 0.5;//长按时间0.5秒
    [_imageView addGestureRecognizer:longPressGesture];
    
    //捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [_imageView addGestureRecognizer:pinchGesture];
    
    //旋转手势
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    //拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImage:)];
    [_imageView addGestureRecognizer:panGesture];
    
    //清扫手势
    //一个清扫手势只能控制一个方向  默认向右，通过direction进行方向控制
    UISwipeGestureRecognizer *swiperGestureToRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiperImage:)];
    [self.view addGestureRecognizer:swiperGestureToRight];
    
    UISwipeGestureRecognizer *swiperGestureToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiperImage:)];
    swiperGestureToLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swiperGestureToLeft];
    //解决拖动和清扫的手势冲突
    [panGesture requireGestureRecognizerToFail:swiperGestureToRight];
    [panGesture requireGestureRecognizerToFail:swiperGestureToLeft];
    //解决长按和拖动的手势冲突
    [longPressGesture requireGestureRecognizerToFail:panGesture];
    
    /*演示不同视图的手势同时执行
    *在上面_imageView已经添加了长按手势，这里给视图控制器的视图也加上长按手势让两者都执行
    */
    self.view.tag = 100;
    _imageView.tag = 200;
    UILongPressGestureRecognizer *viewLongPressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    viewLongPressGesture.delegate=self;
    [self.view addGestureRecognizer:viewLongPressGesture];
    
}


#pragma mark 手势操作
#pragma mark 点按隐藏或显示导航栏
- (void)tapImage:(UITapGestureRecognizer *) gesture{
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
    
}

#pragma mark  长按删除
- (void)longPressImage:(UILongPressGestureRecognizer *) gesture{

    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"是否删除图片？" delegate:self cancelButtonTitle:@"删除图片" otherButtonTitles:@"取消", nil];
        [alert show];
    }
     
}

#pragma mark 捏合缩放
- (void)pinchImage:(UIPinchGestureRecognizer *) gesture{
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _imageView.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
            _imageView.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark 旋转图片
- (void)rotateImage:(UIRotationGestureRecognizer *) gesture{
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _imageView.transform = CGAffineTransformMakeRotation(gesture.rotation);
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        _imageView.transform = CGAffineTransformIdentity; //取消形变
    }
}

#pragma mark 拖动图片
- (void)panImage:(UIPanGestureRecognizer *) gesture{
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint  translation = [gesture translationInView:self.view];
        _imageView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        _imageView.transform = CGAffineTransformIdentity;
    }
}

#pragma mark 清扫图片查看上一张或者下一张
//注意虽然轻扫手势是连续手势，但是只有在识别结束才会触发，不用判断状态
- (void)swiperImage:(UISwipeGestureRecognizer *) gesture{
    //direction记录的轻扫的方向
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) { //向右
        [self nextImage];
    }else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft){ //向左
        [self lastImage];
    }
}

#pragma mark - AlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.view removeFromSuperview];
    }

}

#pragma mark 控制器视图的长按手势
-(void)longPressView:(UILongPressGestureRecognizer *)gesture{
    NSLog(@"view long press!");
}

#pragma mark -手势代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([otherGestureRecognizer.view isKindOfClass:[UIImage class]]) {
        return YES;
    }
    return NO;
}

#pragma mark - 触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch begin...");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch end.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
