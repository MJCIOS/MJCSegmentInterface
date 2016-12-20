//
//  MJCBottomView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCBottomView.h"

@implementation MJCBottomView

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    
    return self;
}


-(void)setBottomBackgroundColor:(UIColor *)bottomBackgroundColor
{
    _bottomBackgroundColor = bottomBackgroundColor;
    if (bottomBackgroundColor == kNilOptions) {
        self.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        
    }else{
        self.backgroundColor = bottomBackgroundColor;
    }

}

-(void)setBottomHidden:(BOOL)bottomHidden SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;
{
    if (SegmentInterFaceStyle == SegMentInterfaceStyleLess) {
        
        if (bottomHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
    }else if (SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
        
        if (bottomHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
        
    }else{
        
        if (bottomHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
    }

}


-(void)isBottomFrame:(BOOL)isBottomFrame setBottomFrame:(CGRect)setBottomFrame bottomHegiht:(CGFloat)bottomHegiht titlesView:(UIView *)titlesView
{
    //如果用户未开启自己设置frame
    if (isBottomFrame == kNilOptions) {
        //如果未设置了底部高度(设置为1)
        if (bottomHegiht == kNilOptions) {
            self.mjc_x = 0;
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            self.mjc_width = titlesView.mjc_width;
        }else{
            //如果未设置了底部高度(那我们就将用户设置的传进去)
            self.mjc_x = 0;
            self.mjc_height = bottomHegiht;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            self.mjc_width = titlesView.mjc_width;
        }
        
    }else{
        self.frame = setBottomFrame;
    }

}

-(void)isBottomFrame:(BOOL)isBottomFrame setBottomFrame:(CGRect)setBottomFrame bottomHegiht:(CGFloat)bottomHegiht titlesScroll:(UIScrollView *)titlesScroll;
{
    //如果用户未开启自己设置frame
    if (isBottomFrame == kNilOptions) {
        //如果未设置了底部高度(设置为1)
        if (bottomHegiht == kNilOptions) {
            self.mjc_x = 0;
            self.mjc_height = 1;
            self.mjc_y = titlesScroll.mjc_height - self.mjc_height;
            self.mjc_width = titlesScroll.contentSize.width;
        }else{
            //如果未设置了底部高度(那我们就将用户设置的传进去)
            self.mjc_x = 0;
            self.mjc_height = bottomHegiht;
            self.mjc_y = titlesScroll.mjc_height - self.mjc_height;
            self.mjc_width = titlesScroll.contentSize.width;
        }
        
    }else{
        self.frame = setBottomFrame;
    }

}


@end
