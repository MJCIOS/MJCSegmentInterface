//
//  MJCTopView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTopView.h"

@implementation MJCTopView


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

-(void)setTopBackgroundColor:(UIColor *)topBackgroundColor
{
    _topBackgroundColor = topBackgroundColor;
    if (topBackgroundColor == kNilOptions) {
        self.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        
    }else{
        self.backgroundColor  = topBackgroundColor;
    }
}
-(void)settopHidden:(BOOL)topHidden SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle
{
    
    //SegMentInterfaceStyleLess少用样式
    if (SegmentInterFaceStyle == SegMentInterfaceStyleLess) {
        if (topHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
    }else if (SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
        if (topHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
        
    }else{
        if (topHidden == kNilOptions) {
            self.hidden = NO;
        }else{
            self.hidden = YES;
        }
    }

    
}

-(void)isTopFrame:(BOOL)isTopFrame settopFrame:(CGRect)topFrame topHegiht:(CGFloat)topHegiht titlesView:(UIView *)titlesView
{
    //如果用户未开启自己设置frame
    if (isTopFrame == kNilOptions) {
        //如果未设置了底部高度(设置为1)
        if (topHegiht == kNilOptions) {
            self.mjc_x = titlesView.mjc_x;
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_y;
            self.mjc_width = titlesView.mjc_width ;
        }else{
            //如果未设置了底部高度(那我们就将用户设置的传进去)
            self.mjc_x = titlesView.mjc_x;
            self.mjc_height = topHegiht;
            self.mjc_y = titlesView.mjc_y;
            self.mjc_width = titlesView.mjc_width;
        }
        
    }else{
        self.frame = topFrame;
    }

}

@end
