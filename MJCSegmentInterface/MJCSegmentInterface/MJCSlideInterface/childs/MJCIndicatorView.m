//
//  MJCIndicatorView.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCIndicatorView.h"
#import "UIView+MJCClassExtension.h"

@implementation MJCIndicatorView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = NO;
        self.enabled = NO;
        self.hidden = NO;
    }
    return self;
}

-(void)setIndicatorImage:(UIImage *)indicatorImage
{
    _indicatorImage = indicatorImage;
 
    [self setImage:indicatorImage forState:UIControlStateNormal];
    [self sizeToFit];
    
}

-(void)setupDefaultFrame:(CGRect)indicatorFrame tabItemBtn:(UIButton*)tabItemBtn;
{
    if (indicatorFrame.size.width == 0) {
        self.jc_width = tabItemBtn.jc_width;
    }else{
        self.jc_width = indicatorFrame.size.width;
    }
    self.jc_centerX = tabItemBtn.jc_centerX;
    
}

@end
