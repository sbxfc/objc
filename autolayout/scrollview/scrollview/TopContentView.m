//
//  TopContentView.m
//  scrollview
//
//  Created by sbxfc on 16/4/12.
//  Copyright © 2016年 me.rungame. All rights reserved.
//

#import "TopContentView.h"

@interface TopContentView ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation TopContentView

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    [self performSelectorOnMainThread:@selector(adjustScrollContentSizeOnMainThread) withObject:nil waitUntilDone:NO];
}

//- (void)adjustScrollContentSizeOnMainThread
//{
//    self.label.preferredMaxLayoutWidth = self.label.bounds.size.width;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.label.text = @"我欲与君相知，长命无绝衰。山无陵，江水为竭，冬雷震震夏雨雪，天地合，乃敢与君绝。";
}

@end
