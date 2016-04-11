//
//  FindMinMaxThread.m
//  thread
//
//  Created by sbxfc on 16/4/11.
//  Copyright © 2016年 me.rungame. All rights reserved.
//

#import "FindMinMaxThread.h"

@implementation FindMinMaxThread{
    NSArray *_numbers;
}

- (instancetype)initWithNumbers:(NSArray *)numbers
{
    self = [super init];
    if (self) {
        _numbers = numbers;
    }
    return self;
}

- (void)main
{
    NSUInteger min;
    NSUInteger max;
    // 进行相关数据的处理
    self.min = min;
    self.max = max;
}

@end
