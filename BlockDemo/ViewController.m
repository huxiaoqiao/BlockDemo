//
//  ViewController.m
//  BlockDemo
//
//  Created by 胡晓桥 on 15/2/27.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showAlert:(id)sender {
    
    [self showDialogViewWithHandle:^(NSUInteger selectIndex) {
        if (selectIndex == 0) {
            NSLog(@"第一个按钮被点击了！");
        }else
        {
            NSLog(@"第二个按钮被点击了！");
        }
    }];
    
}

- (void)showDialogViewWithHandle:(void (^)(NSUInteger selectIndex)) handler
{
    _view = [UIView new];
    _view.center = CGPointMake(SCREEN_WIDTH /2, SCREEN_HEIGHT / 2);
    _view.bounds = CGRectMake(0, 0, SCREEN_WIDTH /2, SCREEN_HEIGHT /2);
    _view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_view];
    CGRect viewFrame = _view.frame;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.center = CGPointMake(viewFrame.size.width /2, viewFrame.size.height /2 - 50);
    button1.bounds = CGRectMake(0, 0, 60, 40);
    button1.tag = 0;
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.center = CGPointMake(viewFrame.size.width /2, viewFrame.size.height /2 + 50);
    button2.bounds = CGRectMake(0, 0, 60, 40);
    button2.tag = 1;
    [button2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    [_view addSubview:button2];
    
    _view.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    [UIView animateWithDuration:0.3 animations:^{
        _view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
    
    self.completeHandle = handler;
}

- (void)clickButton:(UIButton *)sender
{
    NSUInteger selIndex = sender.tag;
    
    if (_completeHandle) {
        _completeHandle(selIndex);
    }
    
    [self closeView];
}
- (void)closeView{
    [UIView animateWithDuration:0.3 animations:^{
        _view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [_view removeFromSuperview];
    }];
}
@end
