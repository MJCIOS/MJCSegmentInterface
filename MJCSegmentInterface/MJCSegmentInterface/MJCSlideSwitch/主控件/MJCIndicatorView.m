//
//  MJCIndicatorView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCIndicatorView.h"

@interface MJCIndicatorView ()

/** 颜色标示符(为了让用户能自定义颜色效果) */
@property (nonatomic,assign) NSInteger colorTag;

/** 位置标示符(代表用户自定义位置大小) */
@property (nonatomic,assign) NSInteger frameTag;

/** 宽度标示符(代表用户自定义宽度) */
@property (nonatomic,assign) NSInteger widthTag;

@end

@implementation MJCIndicatorView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.mjc_height = 1;
        
    }
    return self;
}

-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _indicatorHidden = indicatorHidden;
    
    self.hidden = indicatorHidden;
}

-(void)setIndicatorHeight:(CGFloat)indicatorHeight
{
    _indicatorHeight = indicatorHeight;
    
    self.mjc_height = indicatorHeight;
}

-(void)titlesScroll:(UIScrollView *)titlesScroll firstButton:(UIButton *)firstButton SegmentInterFaceStyle:(MJCIndicatorStyles)SegmentIndicatorStyle;
{
    [self setupFrameY:titlesScroll.mjc_height - self.mjc_height firstButton:firstButton SegmentIndicatorStyle:SegmentIndicatorStyle];
}

-(void)titlesView:(UIView *)titlesView firstButton:(UIButton *)firstButton SegmentInterFaceStyle:(MJCIndicatorStyles)SegmentIndicatorStyle
{
    [self setupFrameY:titlesView.mjc_height - self.mjc_height firstButton:firstButton SegmentIndicatorStyle:SegmentIndicatorStyle];
}

-(void)setIndicatorFrame:(CGRect)indicatorFrame
{
    _indicatorFrame = indicatorFrame;
    
    _frameTag = 1;
    
    self.frame = indicatorFrame;
}

-(void)setIndicatorWidth:(CGFloat)indicatorWidth
{
    _indicatorWidth = indicatorWidth;
    
    _widthTag = 1;
    
    self.mjc_width = indicatorWidth;
}

-(void)setIndicatorBackgroundColor:(UIColor *)indicatorBackgroundColor
{
    _indicatorBackgroundColor = indicatorBackgroundColor;
    
    _colorTag = 1;
    
    self.backgroundColor = indicatorBackgroundColor;
}

-(void)setupFrameY:(CGFloat)frameY firstButton:(UIButton *)firstButton SegmentIndicatorStyle:(MJCIndicatorStyles)SegmentIndicatorStyle
{
    
    if (_colorTag  == 1) {
        self.backgroundColor = self.backgroundColor;
    }else{
        self.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    }
    
    if (_frameTag == 1) {
        
        self.mjc_centerX = firstButton.mjc_centerX;
        self.mjc_y = self.frame.origin.y;
        self.mjc_width = self.frame.size.width;
        self.mjc_height = self.frame.size.height;
        
    }else{
        
        if (_widthTag == 1) {
            
            self.mjc_width = self.mjc_width;
            
        }else{
            
            if (SegmentIndicatorStyle == MJCIndicatorItemStyle) {
                self.mjc_width = firstButton.mjc_width;
            }else{
                self.mjc_width = firstButton.titleLabel.mjc_width;
            }
        }
        
        self.mjc_y = frameY;
        self.mjc_centerX = firstButton.mjc_centerX;
    }
    
    
}



@end
