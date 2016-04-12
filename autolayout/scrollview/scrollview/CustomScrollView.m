//
//  CustomScrollView.m
//  scrollview
//
//  Created by sbxfc on 16/4/12.
//  Copyright © 2016年 me.rungame. All rights reserved.
//

#import "CustomScrollView.h"

@interface CustomScrollView ()

@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation CustomScrollView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self loadContentView];
}

-(void)loadContentView
{
    UIView *contentView = [[[NSBundle mainBundle] loadNibNamed:@"TopContentView" owner:self options:nil] firstObject];
    [self.topView addSubview:contentView];
    
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.topView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1.0
                                                              constant:0.0f]];
    [self.topView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                             attribute:NSLayoutAttributeTrailing
                                                            multiplier:1.0
                                                              constant:0.0f]];
    [self.topView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:0.0f]];
    [self.topView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:0.0f]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
