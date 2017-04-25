//
//  MJCTabItemButton.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/11/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTabItemButton.h"
#import "UIView+MJCExtenSion.h"
#import "MJCSegmentInterface.h"


@interface MJCTabItemButton()

/** buttonW */
@property (nonatomic,assign) CGFloat btnW;
@property (nonatomic,assign) CGFloat btnH;

@property (nonatomic,assign) CGFloat btnX;

@end


@implementation MJCTabItemButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.imageView.contentMode = UIViewContentModeCenter;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_imageStyle == MJCImageUpDownStyle) {
        self.imageView.mjc_y = 3;
        self.imageView.mjc_centerX = self.mjc_width / 2;
        self.titleLabel.mjc_x = 0;
        self.titleLabel.mjc_y = self.imageView.mjc_bottom;
        [self.titleLabel sizeToFit];
        self.titleLabel.mjc_centerX = self.imageView.mjc_centerX;
    }
}

-(void)setuptabItemTitlesFont:(CGFloat)titlesMaxFont tabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    if (self.tag == 0) {
        self.titleLabel.font = [UIFont systemFontOfSize:titlesMaxFont];
    }else{
        self.titleLabel.font = tabItemTitlesfont;
    }
}

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _tabItemTitlesfont = tabItemTitlesfont;
    if (tabItemTitlesfont) {
        self.titleLabel.font = tabItemTitlesfont;
    }else{
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
}

-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _tabItemBackColor = tabItemBackColor;
    if (tabItemBackColor) {
        self.backgroundColor = tabItemBackColor;
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
}

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _tabItemTitleNormalColor = tabItemTitleNormalColor;
    if (tabItemTitleNormalColor) {
        [self setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }else{
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}
-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _tabItemTitleSelectedColor = tabItemTitleSelectedColor;
    if (tabItemTitleSelectedColor) {
        [self setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }else{
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    }
}

-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _tabItemImageNormal = tabItemImageNormal;
    
    [self setImage:tabItemImageNormal forState:UIControlStateNormal];
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    
    [self setImage:tabItemImageSelected forState:UIControlStateSelected];
}

-(void)setTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal
{
    _tabItemBackImageNormal = tabItemBackImageNormal;
    
    [self setBackgroundImage:tabItemBackImageNormal forState:UIControlStateNormal];
}

-(void)setTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected
{
    _tabItemBackImageSelected = tabItemBackImageSelected;
    
    [self setBackgroundImage:tabItemBackImageSelected forState:UIControlStateSelected];
}

-(void) buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH titlesScrollView:(UIScrollView*)titlesScrollView buttonTag:(NSInteger)buttonTag
{
    self.tag = buttonTag;
    [self setTitle:self.titleArr[buttonTag] forState:UIControlStateNormal];
    
    if (buttonW) {
        self.btnW = buttonW;
    }else{
        self.btnW = 80;
    }
    
    self.btnX = buttonTag * self.btnW;
    self.btnH = buttonH;
    
    [self.titleLabel sizeToFit];
    
    self.frame = CGRectMake(self.btnX,0,self.btnW,self.btnH);
        
    [titlesScrollView addSubview:self];
}

-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray
{
    _tabItemNormalImageArray =tabItemNormalImageArray;
    
    if (self.tag >= tabItemNormalImageArray.count) {
        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemNormalImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemNormalImageArray[self.tag]] forState:UIControlStateNormal];
    }
}

-(void)setTabItemSelectedImageArray:(NSArray *)tabItemSelectedImageArray
{
    _tabItemSelectedImageArray = tabItemSelectedImageArray;
    
    if (self.tag >= tabItemSelectedImageArray.count) {
        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemSelectedImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemSelectedImageArray[self.tag]] forState:UIControlStateSelected];
    }
}

-(void)setTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray
{
    _tabItemNormalBackImageArray = tabItemNormalBackImageArray;
    if (self.tag >= tabItemNormalBackImageArray.count) {
        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemNormalBackImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemNormalBackImageArray[self.tag]] forState:UIControlStateNormal];
    }
}

-(void)setTabItemSelectedBackImageArray:(NSArray *)tabItemSelectedBackImageArray
{
    _tabItemSelectedBackImageArray = tabItemSelectedBackImageArray;
    if (self.tag >= tabItemSelectedBackImageArray.count) {
        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemSelectedBackImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemSelectedBackImageArray[self.tag]] forState:UIControlStateSelected];
    
    }
}


@end
