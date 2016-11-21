//
//  MJCIndicatorView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCIndicatorView.h"

@implementation MJCIndicatorView


//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    
    return self;
    
}


//获取子控件(重写方法,保证能赋值成功)
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}

-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame indicatorWidth:(CGFloat)indicatorWidth titlesScroll:(UIScrollView *)titlesScroll firstTitleButton:(UIButton *)firstTitleButton SegmentInterFaceStyle:(MJCSegmentIndicatorStyle)SegmentIndicatorStyle;
{
    if (isindicatorFrame == kNilOptions) {
        if (indicatorWidth == kNilOptions) {
            self.mjc_height = 1;
            self.mjc_y = titlesScroll.mjc_height - self.mjc_height;
            if (SegmentIndicatorStyle == SegMentIndicatorItemStyle) {
                self.mjc_width = firstTitleButton.mjc_width;
            }else{
                self.mjc_width = firstTitleButton.titleLabel.mjc_width;
            }
            self.mjc_centerX = firstTitleButton.mjc_centerX;
            
        }else{
            self.mjc_height = 1;
            self.mjc_y = titlesScroll.mjc_height - self.mjc_height;
            self.mjc_width = indicatorWidth;
            self.mjc_centerX =firstTitleButton.mjc_centerX;
        }
        
    }else{
        
        self.frame = indicatorFrame;
    }

}


-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame indicatorWidth:(CGFloat)indicatorWidth titlesView:(UIView *)titlesView firstTitleButton:(UIButton *)firstTitleButton SegmentInterFaceStyle:(MJCSegmentIndicatorStyle)SegmentIndicatorStyle
{
    if (isindicatorFrame == kNilOptions) {
        if (indicatorWidth == kNilOptions) {
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            if (SegmentIndicatorStyle == SegMentIndicatorItemStyle) {
                self.mjc_width = firstTitleButton.mjc_width;
            }else{
                self.mjc_width = firstTitleButton.titleLabel.mjc_width;
            }
            self.mjc_centerX = firstTitleButton.mjc_centerX;
            
        }else{
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            self.mjc_width = indicatorWidth;
            self.mjc_centerX = firstTitleButton.mjc_centerX;
        }
        
    }else{
        
        self.frame = indicatorFrame;
    }
}


-(void)setIndicatorColor:(UIColor *)indicatorColor firstTitleButton:(UIButton*)firstTitleButton
{
    
    if (indicatorColor == kNilOptions) {
        
        self.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    }else{
        self.backgroundColor = indicatorColor;
    }
}


-(void)setIndicatorViewHidden:(BOOL)indicatorViewHidden
{
    if (indicatorViewHidden == kNilOptions) {
        self.hidden = NO;
    }else{
        self.hidden = YES;
    }
}




@end
