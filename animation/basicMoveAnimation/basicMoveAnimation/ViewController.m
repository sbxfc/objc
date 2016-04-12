//
//  ViewController.m
//  basicMoveAnimation
//
//  Created by sbx_fc on 15-4-1.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIView* yellowView;
    UIView* blueView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    [btn setFrame:CGRectMake(10, 120, 150, 75)];
    [btn setTitle: @"touch me" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    blueView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 150, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    yellowView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 150, 100)];
    yellowView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:yellowView];
}

-(void)action:(id)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.byValue = @500.0f;
    animation.duration = 0.5f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [yellowView.layer addAnimation:animation forKey:@"basic"];
    
    animation.beginTime = CACurrentMediaTime() + 0.5f;
    [blueView.layer addAnimation:animation forKey:@"basic"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
