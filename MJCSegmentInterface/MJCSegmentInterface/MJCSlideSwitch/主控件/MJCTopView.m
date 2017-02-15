//
//  MJCTopView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTopView.h"

@interface MJCTopView ()

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger topTag;

@end

@implementation MJCTopView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        self.hidden = YES;
        self.mjc_x = 0;
        self.mjc_y = 0;
        self.mjc_height = 1;
    }
    
    return self;
}

-(void)setTopBackgroundColor:(UIColor *)topBackgroundColor
{
    _topBackgroundColor = topBackgroundColor;
    self.backgroundColor  = topBackgroundColor;
}

-(void)setTopHidden:(BOOL)topHidden
{
    _topHidden = topHidden;
    self.hidden = topHidden;
}

-(void)setTopFrame:(CGRect)topFrame
{
    _topFrame = topFrame;
    
    _topTag = 1;
    self.frame = topFrame;
}

-(void)setTopHeight:(CGFloat)topHeight
{
    _topHeight = topHeight;
    self.mjc_height = topHeight;
}

-(void)setTitlesView:(UIView *)titlesView
{
    _titlesView = titlesView;
    
    if (_topTag == 1) {
        self.mjc_width = self.frame.size.width;
    }else{
        self.mjc_width = titlesView.mjc_width;
    }
}

-(void)setTitlesScrollView:(UIScrollView *)titlesScrollView
{
    _titlesScrollView = titlesScrollView;
    
    if (_topTag == 1) {
        self.mjc_width = self.frame.size.width;
    }else{
        self.mjc_width = titlesScrollView.contentSize.width;
    }
}




@end
