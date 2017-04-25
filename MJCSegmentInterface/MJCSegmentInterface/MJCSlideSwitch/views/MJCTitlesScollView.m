//
//  MJCTitlesScollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesScollView.h"

@implementation MJCTitlesScollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.titlesScrollColor = [UIColor whiteColor];
    }
    return self;
}


-(void)setTitlesScrollColor:(UIColor *)titlesScrollColor
{
    _titlesScrollColor = titlesScrollColor;
    self.backgroundColor = titlesScrollColor;
}

-(void)setTitlesScrollFrame:(CGRect)titlesScrollFrame
{
    _titlesScrollFrame = titlesScrollFrame;
    
    if (self.mainViews.mjc_width != MJCScreenWidth) {
        self.frame = CGRectMake(0,0, self.mainViews.mjc_width,titlesScrollFrame.size.height);
    }else{
        self.frame = titlesScrollFrame;
    }
    
}

@end
