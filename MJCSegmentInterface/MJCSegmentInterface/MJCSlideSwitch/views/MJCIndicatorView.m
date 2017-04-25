//
//  MJCIndicatorView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCIndicatorView.h"

@interface MJCIndicatorView ()

@property (nonatomic,assign) CGFloat indicatorY;

@property (nonatomic,assign) CGFloat indicatorCenterX;
@end

@implementation MJCIndicatorView

-(void)setTitlesScrollView:(UIScrollView *)titlesScrollView
{
    _titlesScrollView = titlesScrollView;
    self.indicatorY = titlesScrollView.mjc_height - 1;
}
-(void)setSelectedTitleButton:(UIButton *)selectedTitleButton
{
    _selectedTitleButton = selectedTitleButton;
    self.indicatorCenterX = selectedTitleButton.mjc_centerX;
}

-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _indicatorHidden = indicatorHidden;
    self.hidden = indicatorHidden;
}

-(void)setIndicatorHeight:(CGFloat)indicatorHeight
{
    _indicatorHeight = indicatorHeight;
    
    if (indicatorHeight) {
        self.mjc_height = indicatorHeight;
    }else{
        self.mjc_height = 1;
    }
    
    self.mjc_y = self.indicatorY;
    self.mjc_centerX = self.indicatorCenterX;
}

-(void)setIndicatorWidth:(CGFloat)indicatorWidth
{
    _indicatorWidth = indicatorWidth;
    
    if (indicatorWidth) {
        self.mjc_width = indicatorWidth;
    }else{
        if (_MJCIndicatorStyle == MJCIndicatorItemStyle) {
            self.mjc_width = self.selectedTitleButton.mjc_width;
        }else{
            self.mjc_width = self.selectedTitleButton.titleLabel.mjc_width;
        }
    }
    
    self.mjc_y = self.indicatorY;
    self.mjc_centerX = self.indicatorCenterX;
}

-(void)setIndicatorBackgroundColor:(UIColor *)indicatorBackgroundColor
{
    _indicatorBackgroundColor = indicatorBackgroundColor;
    
    if (indicatorBackgroundColor) {
        self.backgroundColor = indicatorBackgroundColor;
    }else{
        self.backgroundColor = [self.selectedTitleButton titleColorForState:UIControlStateSelected];
    }
}




//-(void)setIndicatorFrame:(CGRect)indicatorFrame
//{
//    _indicatorFrame = indicatorFrame;
//    _frameTag = 1;
//    self.frame = indicatorFrame;
//}





@end
