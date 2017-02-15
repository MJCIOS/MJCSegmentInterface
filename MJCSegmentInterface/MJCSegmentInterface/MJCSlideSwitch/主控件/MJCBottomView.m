//
//  MJCBottomView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCBottomView.h"

@interface MJCBottomView ()

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger bottomTag;

@end

@implementation MJCBottomView

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        self.hidden = YES;
        self.mjc_x = 0;
        self.mjc_height = 1;
    }
    
    return self;
}


-(void)setBottomBackgroundColor:(UIColor *)bottomBackgroundColor
{
    _bottomBackgroundColor = bottomBackgroundColor;
    
    self.backgroundColor = bottomBackgroundColor;
}

-(void)setBottomFrame:(CGRect)bottomFrame
{
    _bottomFrame = bottomFrame;
    
    _bottomTag = 1;
    
    self.frame = bottomFrame;
}

-(void)setBottomHeight:(CGFloat)bottomHeight
{
    _bottomHeight = bottomHeight;
    
    self.mjc_height = bottomHeight;
}

-(void)setBottomHidden:(BOOL)bottomHidden
{
    _bottomHidden = bottomHidden;
    
    self.hidden = bottomHidden;
}

-(void)setTitlesView:(UIView *)titlesView
{
    _titlesView =titlesView;
    
    
    
    if (_bottomTag == 1) {
        self.mjc_width = self.frame.size.width;
    }else{
        self.mjc_y = titlesView.mjc_height - self.mjc_height;
        self.mjc_width = titlesView.mjc_width;
    }
}

-(void)setTitlesScrollView:(UIScrollView *)titlesScrollView
{
    _titlesScrollView = titlesScrollView;

    if (_bottomTag == 1) {
        self.mjc_width = self.frame.size.width;
    }else{
        self.mjc_y = titlesScrollView.mjc_height - self.mjc_height;
        self.mjc_width = titlesScrollView.contentSize.width;
    }    
}




@end
