//
//  ViewController.m
//  animation
//
//  Created by sbx_fc on 15-3-30.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView* tank;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     /**
     * 使用定时器实时更新信息
     */
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(update:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:myTimer forMode:NSRunLoopCommonModes];
    
    /**
     * 坦克
     */
    UIImage* image = [UIImage imageNamed:@"tank"];
    tank = [[UIImageView alloc]initWithImage:image];
    tank.backgroundColor = [UIColor blackColor];
    tank.center = CGPointMake(0, self.label3.frame.origin.y + self.label3.frame.size.height + 10 + image.size.height/2);
    tank.image = image;
    [self.view addSubview:tank];
    
     /**
     * 简单的移动动画
     */
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @455;
    animation.duration = 10.f;
     /**
     * 设置以下两个属性,可以让图片停在动画末端
     * 但是,让一个动画维持一个状态会很消耗性能。
     */
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [tank.layer addAnimation:animation forKey:@"basic"];
}

 /**
 * 刷新图片位置信息
 */
-(void)update:(NSTimer*)timer
{
     /**
     * 显示 presentation layer 的位置
     */
    CALayer *layer = [tank.layer presentationLayer];
    NSString* text = [NSString stringWithFormat:@"layer.presentationLayer[%f,%f]",layer.frame.origin.x,layer.frame.origin.y];
    self.label1.text = text;
    [self.label1 setNeedsDisplay];
    
     /**
     * 显示 model layer 的位置
     */
    layer = [tank.layer modelLayer];
    text = [NSString stringWithFormat:@"layer.modelLayer[%f,%f]",layer.frame.origin.x,layer.frame.origin.y];
    self.label2.text = text;
    [self.label2 setNeedsDisplay];
    
     /**
     * 显示 view 的位置
     */
    layer = tank.layer;
    text = [NSString stringWithFormat:@"view.frame[%f,%f]",layer.frame.origin.x,layer.frame.origin.y];
    self.label3.text = text;
    [self.label3 setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
