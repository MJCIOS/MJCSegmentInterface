//
//  MJCTitlesScollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesScollView.h"

@implementation MJCTitlesScollView

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.titlesScrollColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setMainViews:(UIView *)mainViews
{
    _mainViews = mainViews;
    
    [mainViews addSubview:self];
}

//-(void)addSubviews:(UIView *)mainViews SegmentInterfaceStyle:(MJCSeMentTitleBarStyles)SegmentInterfaceStyle;
//{
////    if (SegmentInterfaceStyle != SegMentInterfaceStyleNavBar) {
////        [mainViews addSubview:self];
////        return;
////    }
//}

-(void)setTitlesScrollColor:(UIColor *)titlesScrollColor
{
    _titlesScrollColor = titlesScrollColor;
    
    self.backgroundColor = titlesScrollColor;
}

-(void)setTitlesScrollFrame:(CGRect)titlesScrollFrame
{
    _titlesScrollFrame = titlesScrollFrame;
    
    self.frame = titlesScrollFrame;
}

@end
