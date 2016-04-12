//
//  ViewController.m
//  KeyFrameAnimation
//
//  Created by sbx_fc on 15-4-2.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage* image = [UIImage imageNamed:@"form"];
    UIImageView* form = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    form.image = image;
    [self.view addSubview:form];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4f;
    animation.repeatCount = HUGE_VAL;
    animation.additive = YES;
    
    [form.layer addAnimation:animation forKey:@"shake"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
