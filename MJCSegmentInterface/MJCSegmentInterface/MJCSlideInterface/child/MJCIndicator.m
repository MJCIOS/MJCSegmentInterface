//
//  MJCIndicator.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/24.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCIndicator.h"

@implementation MJCIndicator

+(instancetype)showIndicator;
{
    return [self buttonWithType:UIButtonTypeCustom];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = NO;
        self.enabled = NO;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}



@end
