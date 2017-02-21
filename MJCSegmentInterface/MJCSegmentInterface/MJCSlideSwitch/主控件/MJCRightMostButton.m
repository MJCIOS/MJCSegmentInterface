//
//  MJCRightMostButton.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/1/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCRightMostButton.h"


static const CGFloat rightBottomMargin = 1;
static const CGFloat rightTopMargin = 1;
static const CGFloat rightMargin = 1;


@interface MJCRightMostButton ()


@property (nonatomic,assign) NSInteger rightMostTag;

@end

@implementation MJCRightMostButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    
    return self;
    
}

-(void)setRightBtnBackColor:(UIColor *)rightBtnBackColor
{
    _rightBtnBackColor = rightBtnBackColor;
    self.backgroundColor = rightBtnBackColor;
}

-(void)setRightBtnHidden:(BOOL)rightBtnHidden
{
    _rightBtnHidden = rightBtnHidden;
    self.hidden = rightBtnHidden;
}
-(void)setRightMostBtnImage:(UIImage *)rightMostBtnImage
{
    _rightMostBtnImage = rightMostBtnImage;
    
    [self setImage:_rightMostBtnImage forState:UIControlStateNormal];
}

-(void)setRightMostBtnFrame:(CGRect)rightMostBtnFrame
{
    _rightMostBtnFrame = rightMostBtnFrame;
    
    _rightMostTag = 1;
    
    self.frame = rightMostBtnFrame;
}

-(void)setupRightFrame:(UIButton *)titlesButton titlesScrollView:(UIScrollView *)titlesScrollView
{
    if (_rightMostTag == 0) {
        CGFloat rightMostH = titlesButton.mjc_height - (rightTopMargin + rightBottomMargin);
        CGFloat rightMostW = titlesButton.mjc_width / 2 ;
        CGFloat rightBtnY = titlesScrollView.mjc_y + rightMargin;
        self.frame = CGRectMake(MJCScreenWidth - rightMostW - rightMargin,rightBtnY,rightMostW,rightMostH);
    }else{
        self.frame = self.frame;
    }
}


@end
