//
//  ViewController.m
//  GestureLock
//
//  Created by yuqian on 15/6/30.
//  Copyright (c) 2015年 zhdwl. All rights reserved.
//

#import "ViewController.h"
#import "GestureLockView.h"

@interface ViewController ()<GestureLockDelegate>

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *backImge = [[UIImageView alloc]initWithFrame:self.view.frame];
    backImge.image = [UIImage imageNamed:@"back.png"];
    [self.view addSubview:backImge];
    //self.view.backgroundColor = [UIColor lightGrayColor];
    
    GestureLockView *gesView = [[GestureLockView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-self.view.frame.size.width-60, self.view.frame.size.width, self.view.frame.size.width)];
    gesView.delegate = self;
    [self.view addSubview:gesView];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 80, 100, 30)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"请设置密码";
    _label.textColor = [UIColor greenColor];
    [self.view addSubview:_label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetLabel
{
    _label.text = @"请输入密码";
}

#pragma mark - GestureLockViewDelegate

//原密码为nil调用
- (void)GestureLockSetResult:(NSString *)result gestureView:(GestureLockView *)gestureView
{
    NSLog(@"输入密码：%@",result);
    [gestureView setRigthResult:result];
    _label.text = @"请输入密码";
}

//密码核对成功调用
- (void)GestureLockPasswordRight:(GestureLockView *)gestureView
{
    NSLog(@"密码正确");
    _label.text = @"密码正确";
}

//密码核对失败调用
- (void)GestureLockPasswordWrong:(GestureLockView *)gestureView
{
    NSLog(@"密码错误");
    _label.text = @"密码错误";
    [self performSelector:@selector(resetLabel) withObject:nil afterDelay:1];
}

@end
