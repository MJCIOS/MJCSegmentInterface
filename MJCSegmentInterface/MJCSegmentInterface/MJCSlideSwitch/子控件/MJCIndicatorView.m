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

//设置底部指示器的frame
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame indicatorWidth:(CGFloat)indicatorWidth titlesView:(UIView *)titlesView firstTitleButton:(UIButton *)firstTitleButton SegmentInterFaceStyle:(MJCSegmentIndicatorStyle)SegmentIndicatorStyle
{
    //用户是否开启
    if (isindicatorFrame == kNilOptions) {
        //用户是否在外界设置了宽度
        if (indicatorWidth == kNilOptions) {
            
            //默认设置的宽度大小(中心X要最后设置,要不然会出问题)
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            //设置底部指示器的样式
            if (SegmentIndicatorStyle == SegMentIndicatorItemStyle) {
            
                self.mjc_width = firstTitleButton.mjc_width;
            
            }else{
                self.mjc_width = firstTitleButton.titleLabel.mjc_width;
            }
            self.mjc_centerX = firstTitleButton.mjc_centerX;
            
        }else{
            //用户传入的宽度
            self.mjc_height = 1;
            self.mjc_y = titlesView.mjc_height - self.mjc_height;
            self.mjc_width = indicatorWidth;
            self.mjc_centerX =firstTitleButton.mjc_centerX;
        }
        
    }else{
        //用户传入的frame
        self.frame = indicatorFrame;
    }
    
}

//设置底部指示器的颜色
-(void)setIndicatorColor:(UIColor *)indicatorColor firstTitleButton:(UIButton*)firstTitleButton
{
    //是否传入颜色
    if (indicatorColor == kNilOptions) {
        //底部指示器颜色等于按钮的文字颜色
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
