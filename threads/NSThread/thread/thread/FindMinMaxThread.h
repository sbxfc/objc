//
//  FindMinMaxThread.h
//  thread
//
//  Created by sbxfc on 16/4/11.
//  Copyright © 2016年 me.rungame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindMinMaxThread : NSThread
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger max;
- (instancetype)initWithNumbers:(NSArray *)numbers;
@end
